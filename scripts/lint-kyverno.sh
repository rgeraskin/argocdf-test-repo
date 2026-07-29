#!/usr/bin/env bash
# argocdf `--lint` adapter for kyverno.
#
# argocdf invokes this via `sh -c`, feeding ONE application's rendered
# multi-doc YAML on stdin; every non-empty stdout line becomes a warning.
# It runs once per side (base and target) with that side's worktree as the
# working directory, so the policies resolve to the branch's own versions.
#
# Deliberately NO pipefail/errexit: kyverno exits non-zero whenever a resource
# fails a policy — that is the normal lint-hit case, not a tool failure.
#
# kyverno's output contract (probed against kyverno 1.18):
#   nothing matched the policies' matchConstraints -> exit 0, EMPTY stdout
#   findings                                       -> exit 1, report JSON on stdout
#   genuine failure (bad input, crash)             -> exit 1, EMPTY stdout, error on stderr
# Empty output must therefore be split on kyverno's exit code: rc 0 means "no
# findings" (exit 0 quietly — piping empty input into jq would fake a tool
# failure), rc != 0 with no report is a real crash and must surface (argocdf
# turns the non-zero exit into a lint warning). With a non-empty report, jq is
# the last stage: it masks kyverno's normal findings exit, while unparseable
# output still makes jq itself exit non-zero and surface.
#
# --cluster: policies/kyverno/disallow-kube-system-apps.yaml targets a CUSTOM RESOURCE
# (argoproj.io Application, which apps-of-apps parents render), and kyverno can
# only evaluate a resource whose GVK it can map to a GVR. Live discovery against
# the cluster provides that mapping; the alternative is vendoring the CRD via
# --crd-path, which is a second copy to keep in sync (a schema-less stub with
# x-kubernetes-preserve-unknown-fields is enough, if that is ever preferred).
# The cluster to consult is argocdf's, NOT the invoking shell's: argocdf exports
# ARGOCDF_CONTEXT (its resolved context) and ARGOCDF_KUBECONFIG (its effective
# kubeconfig) to lint commands. ARGOCDF_CONTEXT is REQUIRED here rather than
# optional: without it kyverno would silently fall back to the ambient context
# and report findings about a DIFFERENT cluster than the one under review, which
# is indistinguishable in the report from a correct result. Failing loudly also
# makes this suite a real guard — it fails the moment argocdf stops exporting.
#
# --continue-on-fail is required regardless of --cluster: a diff tool renders
# manifests that are not in the cluster YET (a PR adding a CRD alongside its CRs,
# a chart shipping CRs for an operator this cluster lacks), and kyverno can only
# evaluate a resource whose GVK it can map to a GVR.
#
# Measured against kyverno 1.18 with one unmappable Widget beside one violating
# Deployment, policies covering both kinds:
#
#                    | stdout      | stderr                       | rc | finding
#   -----------------+-------------+------------------------------+----+--------
#   without the flag | 0 bytes     | failed to map gvk to gvr ...  | 1  | LOST
#   with the flag    | report JSON | 0 bytes                       | 1  | kept
#
# Row 1 is why the flag is not optional: ONE unrelated document discards every
# finding kyverno had already made. Row 2 is the cost — kyverno says NOTHING about
# the kind it skipped, on either stream, so a policy over that kind does not run
# and the report still reads clean. There is no warning to forward: the silence is
# kyverno's, not this adapter discarding it. Hence the README tells users to apply
# CRDs first, and case/lint-unmappable-kind pins both rows.
#
# Note rc is 1 either way, so the exit code alone cannot tell "found violations"
# from "failed to map" — only "was a report produced?" separates them, which is
# exactly the empty-output rule above.
set -u

repo_root="$(git rev-parse --show-toplevel)"

# Each tool owns a directory under policies/, so this adapter hands kyverno its
# own tree and nothing else — the isolation from the conftest policies next door
# is structural, not a property of kyverno's loader. Passing the directory
# rather than a file list also leaves the layout INSIDE it free (kyverno
# recurses) and means a policy added under any file name still runs; a
# policy.yaml glob would have silently skipped it, and a policy that exists but
# never evaluates is invisible.
# The glob below is ONLY an existence guard: handed an empty tree kyverno errors,
# which argocdf would surface as a spurious lint-failure warning instead of the
# correct "nothing to say".
policy_dir="$repo_root/policies/kyverno"

shopt -s nullglob
entries=("$policy_dir"/*)
shopt -u nullglob
[ ${#entries[@]} -eq 0 ] && exit 0

if [ -z "${ARGOCDF_CONTEXT:-}" ]; then
  echo "ARGOCDF_CONTEXT not set: refusing to lint against an unknown cluster"
  exit 1
fi

args=(--resource - --policy-report --continue-on-fail --cluster --output-format json)
# Target argocdf's cluster, not the shell's. The kubeconfig travels through
# KUBECONFIG rather than a --kubeconfig flag: ARGOCDF_KUBECONFIG mirrors
# argocdf's effective kubeconfig, which may be a path LIST (single-file flags
# reject those, KUBECONFIG is defined to accept them), and every
# kubeconfig-reading tool honors the variable while only some have the flag.
# It is a no-op when argocdf inherited KUBECONFIG from this environment, and
# load-bearing when argocdf was given --kubeconfig — which the child would
# otherwise never learn about. The context has no environment equivalent, so it
# goes as a flag, in an array so a value with spaces stays one argument.
# ARGOCDF_KUBECONFIG stays OPTIONAL: absent legitimately means argocdf used the
# ambient kubeconfig, which this process already inherited.
[ -n "${ARGOCDF_KUBECONFIG:-}" ] && export KUBECONFIG="$ARGOCDF_KUBECONFIG"
args+=(--context "$ARGOCDF_CONTEXT")

report="$(kyverno apply "$policy_dir" "${args[@]}" 2>/dev/null)"
rc=$?

if [ -z "$report" ]; then
  [ "$rc" -eq 0 ] && exit 0
  echo "kyverno apply failed (exit $rc) with no report output"
  exit "$rc"
fi

# One line PER RESOURCE, not just resources[0]: `resources` is a LIST in the
# openreports.io PolicyReport schema. kyverno 1.18 puts one entry there per result
# for both policy types, but naming only the first would silently drop subjects if
# any producer ever groups them.
#
# `error` results are reported too, marked: an error is kyverno failing to
# EVALUATE (a broken CEL expression) rather than a resource failing a check, and
# it carries no resources. Dropping them hid the one failure a policy author
# cannot otherwise notice — a broken expression simply stops producing findings.
#
# Kept byte-identical to argocdf's built-in --lint-kyverno adapter, which the e2e
# suite pins by running one fixture through both paths.
printf '%s\n' "$report" | jq -r '
  .results[]?
  | select(.result == "fail" or .result == "warn" or .result == "error")
  | . as $r
  | (if $r.result == "error" then "ERROR " else "" end) as $marker
  | ($r.message | gsub("\n"; " ")) as $msg
  | if ($r.resources | length) > 0
    then $r.resources[] | "[kyverno/\($r.policy)] \($marker)\(.kind)/\(.name): \($msg)"
    else "[kyverno/\($r.policy)] \($marker)\($msg)"
    end
'
