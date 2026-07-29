#!/usr/bin/env bash
# argocdf `--lint` adapter for conftest.
#
# argocdf invokes this via `sh -c`, feeding ONE application's rendered
# multi-doc YAML on stdin; every non-empty stdout line becomes a warning.
# It runs once per side (base and target) with that side's worktree as the
# working directory, so the policies resolve to the branch's own versions.
#
# Deliberately NO pipefail/errexit: conftest exits non-zero whenever a document
# fails a policy — that is the normal lint-hit case, not a tool failure.
#
# conftest's output contract (probed against conftest 0.68 / OPA 1.15):
#   no document failed a policy -> exit 0, report JSON with no .failures
#   findings                    -> exit 1, report JSON on stdout
#   genuine failure (broken rego, input that does not parse)
#                               -> exit 1, EMPTY stdout, error on stderr
# Empty output must therefore be split on conftest's exit code, exactly as in
# the kyverno adapter: rc 0 means "no findings" (exit 0 quietly — piping empty
# input into jq would fake a tool failure), rc != 0 with no report is a real
# crash and must surface (argocdf turns the non-zero exit into a lint warning).
# With a non-empty report, jq is the last stage: it masks conftest's normal
# findings exit, while unparseable output still makes jq itself exit non-zero
# and surface.
#
# Unlike the kyverno adapter, this one is entirely OFFLINE, and that is the
# point of the case it serves: rego evaluates each document as plain data, so
# there is no GVK->GVR mapping to resolve and therefore nothing to gain from
# argocdf's exported ARGOCDF_CONTEXT/ARGOCDF_KUBECONFIG. The whole cluster
# block of the sibling adapter is absent for that reason, not by oversight.
#
# --all-namespaces evaluates every rego package found instead of only `main`,
# and each result's "namespace" (the package name) is what labels the finding.
set -u

repo_root="$(git rev-parse --show-toplevel)"

# Each tool owns a directory under policies/, so this adapter hands conftest its
# own tree and nothing else — the isolation from the kyverno policies next door
# is structural, not a property of conftest's loader. Passing the directory
# rather than a file list also leaves the layout INSIDE it free (conftest
# recurses) and means a policy added under any file name still runs; a
# policy.rego glob would have silently skipped it, and a policy that exists but
# never evaluates is invisible.
# The glob below is ONLY an existence guard: handed an empty tree conftest errors
# ("no policies found"), which argocdf would surface as a spurious lint-failure
# warning instead of the correct "nothing to say".
policy_dir="$repo_root/policies/conftest"

shopt -s nullglob
entries=("$policy_dir"/*)
shopt -u nullglob
[ ${#entries[@]} -eq 0 ] && exit 0

report="$(conftest test --policy "$policy_dir" \
  --parser yaml --all-namespaces --output json - 2>/dev/null)"
rc=$?

if [ -z "$report" ]; then
  [ "$rc" -eq 0 ] && exit 0
  echo "conftest test failed (exit $rc) with no report output"
  exit "$rc"
fi

printf '%s\n' "$report" | jq -r '
  .[]?
  | .namespace as $ns
  | (.failures[]?, .warnings[]?)
  | "[conftest/\($ns)] \(.msg | gsub("\n"; " "))"
'
