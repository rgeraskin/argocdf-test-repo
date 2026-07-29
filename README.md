# argocdf-test-repo — end-to-end test artifact for [argocdf](https://github.com/rgeraskin/argocdf)

This repository IS the test suite: a self-contained ArgoCD repo whose git branches are test cases and whose `expected/` directory pins argocdf's exact output for each case. It exists so argocdf changes can be verified end-to-end — real cluster listing, real helm/kustomize rendering, real apps-of-apps discovery — without ever touching a production environment.

## How it works

```
master                       the stable base state
├── charts/apps/             the root app's chart (apps-of-apps)
│   └── values-apps.yaml    THE CASE CATALOG: one child Application per entry
├── apps/<name>/             APP SOURCES the child apps render (helm charts,
│                            kustomize dirs, plain manifests). NOT the cases:
│                            cases are the branches, and the mapping is not
│                            1:1 — many cases edit only the catalog, several
│                            cases share one app source
├── bootstrap/               manifests bootstrap.sh applies: namespace, root app,
│                            private chart registry + its repository Secret
├── expected/<case>/         everything that verifies one case, in two halves
│   ├── checks.grep          AUTHORED: must:/must-not:/expect: rules the pinned
│   │                        unified.diff has to satisfy, written from the
│   │                        case's intent. Survives regeneration
│   └── reports/             RECORDED: argocdf's own output (unified.diff,
│                            md-fields.md, md-unified.md,
│                            html-side-by-side.html, meta.yaml with the exit
│                            code). Wiped and rewritten by --regenerate, so
│                            cleanup is a glob: rm -rf expected/*/reports
├── policies/<tool>/         one directory per lint tool, which is exactly what
│                            that tool's adapter is handed. kyverno/: one policy
│                            over workloads, one over the Application CRs an
│                            apps-of-apps parent renders (a CUSTOM resource, so
│                            kyverno resolves its CRD from the cluster).
│                            conftest/: rego. A kyverno-test.yaml beside a policy
│                            makes `kyverno apply` emit NOTHING, silently (rc 0,
│                            no stdout, no stderr), which reads as "no findings":
│                            apply recurses to ANY depth and takes any *.yaml
│                            name, but SKIPS dot-files and dot-dirs, so kyverno
│                            test manifests belong in policies/kyverno/.tests/
│                            (conftest is unaffected - its *_test.rego files
│                            define test_* rules, not deny rules)
└── scripts/lint-*.sh        the --lint adapters (fixture content: resolved
                             per side/branch inside argocdf's worktrees).
                             Neither runs by default: the cases that assert on
                             lint output name their adapter in CASE_ARGS

case/<name> branches         one small commit off master each = one test case
                             (see CASES.md for what every case proves)

The test HARNESS (bootstrap/run/normalize scripts) lives in the argocdf repo
(scripts/e2e/) so it co-evolves with argocdf's flags and output formats in a
single PR; this repo carries only what a real ArgoCD repo would: manifests,
charts, policies, the lint adapter — plus the pinned expected outputs.
```

- **Two cluster modes, one expected output.** `e2e:bootstrap` is the baseline: a real ArgoCD install, controller included, so the children and the depth-2 apps they render are synced by the controller exactly as in production. `e2e:bootstrap-static` installs no controller and applies the same Application set once by rendering the charts. Both are verified to produce byte-identical argocdf output — the Application set matches by construction, and argocdf reads only `.spec` and metadata, never the `.status` a controller writes, so nothing it consumes depends on a controller actually running.
- Each `case/<name>` branch changes git content only: an app-source file (render content changes) or `values-apps.yaml` (an Application's spec changes, discovered via argocdf's apps-of-apps recursion). **The cluster is never touched per case.**
- The runner diffs `master → case/<name>` with argocdf (argocd renderer, `--repo-creds cluster`) and byte-compares the normalized reports with `expected/<case>/`. kube-version and cluster API versions are auto-detected — deterministic because the kind node image is pinned by digest via `E2E_KIND_NODE_IMAGE` (bumping that pin is a reviewed regeneration; the extra CRDs a full ArgoCD install brings do NOT change any expectation, since no fixture reads `.Capabilities.APIVersions`). The `--kube-version` override precedence is unit-tested in argocdf (`TestResolveKubeVersion`).
- Reports are deterministic: argocdf sorts application sections; the timestamped provenance footer and per-run temp paths in error messages are stripped by the harness normalizer.

## Running

From the argocdf repository (this repo is its `e2e/` submodule):

```bash
mise run e2e:bootstrap         # baseline: kind + REAL ArgoCD (controller syncs
                               # the children). Needs master PUSHED - see below
mise run e2e:bootstrap-static  # no controller, same Application set applied
                               # once. No push, no sync wait: the fast loop
mise run e2e:run               # build argocdf, run every case, PASS/FAIL table
mise run e2e:push              # publish: rebase case/* onto master, push master,
                               # force-push branches, prune orphaned remote ones
mise run e2e:clean             # delete the kind cluster
```

**Push before running against the baseline.** Its controller syncs the REMOTE repo at `targetRevision: HEAD`, so the cluster reflects *pushed* master, not your working tree. Change a fixture on master and the cluster keeps serving the old one until you `mise run e2e:push` and the controller syncs. Which is why the two modes divide the work:

| Doing | Use | Why |
|---|---|---|
| Developing fixtures, regenerating expectations, the review gate | `e2e:bootstrap-static` | No push, no sync wait, and the pins it produces are the same bytes the baseline yields |
| Verifying the suite, checking argocdf against production shapes | `e2e:bootstrap` | The real control plane: a live controller, its full CRD set, and the actual `argocd-cm`/`argocd-secret` |

Switching from the baseline back to static means recreating the cluster (`e2e:clean`), since a `--static` bootstrap will not uninstall a controller that is already there.

Directly (any argocdf binary):

```bash
# from the argocdf checkout (this repo as its e2e/ submodule):
scripts/e2e/bootstrap.sh
ARGOCDF_BIN=./argocdf scripts/e2e/run.sh                    # all cases
ARGOCDF_BIN=./argocdf scripts/e2e/run.sh case/helm-values   # one case
```

A failing case leaves its actual output and a truncated diff against the expectation under `out/<case>/`.

Network note: `oci-podinfo`/`oci-chart-bump`/`combined-spec-and-values` (ghcr.io), `oci-dependency-bump`/`classic-dependency-bump` (ghcr.io + the podinfo helm repo, via `helm dependency build`), `kustomize-helm` (podinfo helm repo) and `external-repo-source` (podinfo git repo) fetch public artifacts; everything else runs offline. the bootstrap script fetches the pinned ArgoCD Application CRD (or the full install with `--full`) from the argo-cd GitHub repo. `private-chart-bump` needs public DNS only to resolve `127.0.0.1.nip.io` (the chart bytes come from the in-cluster registry); if your router's DNS-rebind protection blocks loopback answers, add `127.0.0.1 127.0.0.1.nip.io` to /etc/hosts.

## The private registry (authenticated pulls)

The cluster runs a tiny authenticated OCI registry (`bootstrap/registry.yaml`: registry + htpasswd + self-signed TLS) seeded by bootstrap with the `private-app` chart in two versions. Its URL, `127.0.0.1.nip.io:5317/charts`, works from BOTH sides of the suite: on the host the name resolves to 127.0.0.1 (public nip.io wildcard DNS) and reaches the registry through kind's port mapping; inside the cluster CoreDNS carries an authoritative hosts entry pointing the same name at the registry Service's fixed ClusterIP, so the real ArgoCD repo-server (full mode) reaches it too — through the identical URL, never consulting nip.io.

Credentials live where ArgoCD keeps them: a repository Secret (`bootstrap/repo-secret.yaml`, `argocd.argoproj.io/secret-type: repository`). The runner passes `--repo-creds cluster`, so argocdf resolves them via ArgoCD's own `util/db` — every suite run exercises the cluster-secret path end-to-end, and `case/private-chart-bump` proves an authenticated pull renders. The committed `e2e`/`e2e` credentials are deliberate: they protect a throwaway in-cluster registry that exists only to test credential plumbing — the suite still contains nothing real and needs no setup.

## Anatomy of a case

`case/helm-values` is one commit on top of master:

```
$ git log -p master..case/helm-values
    case/helm-values: bump replicas 1->2 in chart values
    - replicas: 1
    + replicas: 2
```

`expected/helm-values/unified.diff` pins what argocdf must report for it — down to the byte. `meta.yaml` pins the exit code (`--exit-code` semantics: 0 = no changes, 1 = fatal error, 2 = changes present).

## Adding a case

1. Branch: `git checkout -b case/my-case master`.
2. Make ONE focused change: edit an app source under `apps/` (content case) or `charts/apps/values-apps.yaml` (spec/add/remove case). If the case needs a new child app, add its catalog entry + fixture dir TO MASTER first (and re-run `scripts/e2e/bootstrap.sh` so the cluster learns the new child), then branch the change. **On case branches, `git add` only the files you changed — never `git add -A`** (untracked working files like a fresh `expected/` would be swept into the branch).
3. Commit with a message describing the intent; back to master.
4. Write `expected/my-case/checks.grep` BEFORE regenerating: `must:`/`must-not:` ERE patterns (one per line) that the pinned `unified.diff` has to satisfy — the exact artifact the case exists to prove, derived from the case's intent, never from generated output — plus one `expect:affected=N changed=M [resources=+a,-r,~m] [errors=E]` line authorizing the whole summary block. Predict those numbers from the change (which apps render the touched path, how many resources it can move); a mismatch at regeneration means the case affects more than you thought, which is worth knowing before it is pinned. This is what makes a hollow pin fail instead of getting committed.
5. `ARGOCDF_BIN=./argocdf scripts/e2e/run.sh --regenerate case/my-case` (from the argocdf checkout; the harness runs the checks against the regenerated pins automatically).
6. **Review `expected/my-case/` like code** — it is the assertion; the checks file is a floor, not the review. Add the case's row to [CASES.md](CASES.md) — change, expected report content, and what it proves.
7. Commit `expected/my-case/` (+ CASES.md) on master, then publish with `mise run e2e:push` (which refuses to publish pins that fail review).

(In the argocdf repo there is an `e2e-add-case` Claude skill that walks this flow, including the pitfalls.)

### How review and the checks file divide the work

**Reviewing the diff is the primary check.** After `--regenerate`, `git -C e2e diff` should usually show *nothing*; a case whose reports changed is the signal to investigate, with [CASES.md](CASES.md) saying what that case is supposed to prove. That loop catches regressions in existing cases well, and the checks file adds nothing there.

**The checks file covers the two things reading a diff structurally cannot.** A brand-new case has no baseline: `git diff` shows its whole expectation as *added*, so "nothing changed" never applies and you are left reading a plausible report and deciding whether it proves the claim — which is exactly where hollow pins are born. And when an intended change legitimately rewrites many cases at once, you review looking for the change you expect; a case that also quietly *lost* its finding hides in the noise, because eyes are far better at spotting added lines than missing ones. A `must:` line asserts the artifact is still there, mechanically, every time.

**The `expect:` line covers the opposite failure: a report with something EXTRA in it.** `must:`/`must-not:` assert presence and absence of named artifacts, and nothing about the rest of the report — so an unexpected application section or an extra changed resource is simply pinned, and the byte comparison cannot object, because `--regenerate` wrote that pin. `expect:affected=N changed=M [resources=+a,-r,~m] [errors=E]` authorizes the summary block as a whole (omitted fields must be absent from the report too), and since the checks file survives regeneration while `reports/` does not, an extra app or resource fails the gate instead of becoming the new baseline.

So: it is an automated safeguard layered on the diff review, not a replacement for it. It fails fast — at `--regenerate`, before a bad pin reaches a commit — and it keeps asserting, since the gate also runs on every full `run.sh` and inside `push.sh`. Diff review notices *what changed*; the gate notices what is *missing* (`must:`), what must never appear (`must-not:`) and what is *extra* (`expect:`).

## Updating expectations after an intended argocdf behavior change

```bash
mise run e2e:regenerate      # rewrites all expected/ from the current binary
                             # (and re-runs the review gate against them)
git -C e2e diff              # REVIEW: every hunk is a behavior change you ship
```

If the intended behavior change invalidates a case's proof, update `expected/<case>/checks.grep` in the same commit — consciously, like the reports themselves.

Any commit to master (fixtures, catalog, regenerated expectations) leaves the `case/*` branches based one commit behind. The publish step handles this: `mise run e2e:push` rebases every branch onto master (each is a single commit, so this is conflict-free unless a branch edits the same lines), verifies the one-commit-off-master invariant, pushes master and **force-pushes** the branches — force is inherent to the model, since rebasing rewrites every branch head on every master change.

## What the cases cover

Every change-intention class observed in a categorization of 109 real production PRs (the 0.5.0 regression sweep), plus argocdf-specific behaviors: see **[CASES.md](CASES.md)** for the per-case list. Keep it updated when adding a case.

Three cases pin argocdf's *actual* contract rather than an idealized one — by design, so behavior changes are always conscious:

- `kustomize-relative-base` pins a known limitation: a change to a directory referenced only through a `../relative` kustomize base matches no app's source path, so NO app is reported affected (0 affected / exit 0).
- `error-invalid-yaml` pins that app-level render errors are REPORT content (error sections per app), not a process failure: exit code stays 0 because no app *changed*.
- `no-changes` pins the affected-but-unchanged path: a comment-only catalog edit re-renders the root app (1 affected) with zero manifest changes, exit 0.

Determinism note: charts that generate random values per render (e.g. helm test hooks with `randAlphaNum` names — podinfo does this) would make expectations flaky; podinfo-rendering apps set `helm.skipTests: true` / kustomize `skipTests: true` for exactly this reason. The runner passes `--no-cache`, so every run is a fresh render and such nondeterminism fails immediately instead of hiding behind render-cache hits.

The renderer under test is `--renderer argocd` (ArgoCD's own repo-server code) — the engine argocdf is migrating to. Credentials are `--repo-creds cluster`: repository credentials come from cluster Secrets via ArgoCD's own code, exercised on every run (see "The private registry" above — the only credentials anywhere are the committed test ones for the throwaway in-cluster registry).

Those flags are the suite-wide defaults (`DEFAULT_ARGS` in the harness's `run.sh`). A case that needs a different flag set — another renderer, another creds mode, an extra lint command — gets a `CASE_ARGS` entry keyed by its branch name instead of a second runner; the entry's flags are appended, so a scalar flag like `--renderer native` overrides the default on its own. A case has one expectation dir either way, so changing its flags means regenerating it.

Lint runs only for the cases that pin findings (see CASES.md), and the kyverno adapter runs `kyverno apply --cluster`, so it doubles as the reference implementation of argocdf's lint-environment contract: it targets argocdf's own cluster through the exported `ARGOCDF_CONTEXT`/`ARGOCDF_KUBECONFIG` rather than the invoking shell's context. `case/lint-cr-policy` is what verifies that end to end — its pinned finding comes from a policy over Application CRs, which kyverno can only evaluate once it has resolved that CRD from the cluster, so a broken propagation makes the finding vanish (or turns it into a lint-failure line) and the case fails.

`case/lint-conftest` covers the opposite shape: a second `--lint` command (`scripts/lint-conftest.sh`, added through the harness's `CASE_ARGS`) running an OFFLINE linter. Rego evaluates each document as plain data, so there is no CRD to resolve and the adapter carries none of kyverno's cluster machinery — what it shares is the part that is actually the contract: stdin, one warning per stdout line, and empty output resolved by the tool's exit code. conftest cannot reuse the kyverno policies at all (its policy language is rego only; handed a `ValidatingAdmissionPolicy` it reports "no policies found"), and the rego policy is deliberately orthogonal to them, so every lint line in that case's report can only have come from conftest. Each tool gets its OWN directory under `policies/` rather than a shared tree filtered by file extension: the isolation is then structural instead of a property of each loader, and nothing has to reason about what the other tool does with files it does not understand.

`case/lint-two-adapters` pins the pair rather than either tool: with both commands configured, one app that trips both policies must yield one kyverno finding AND one conftest finding in the same report, so a runner that stopped after the first command — or let one command's stdout clobber the other's — fails the case. argocdf iterates `--lint` commands in argv order with no concurrency, so the two warning lines are ordered rather than raced, and the byte-exact pin makes that ordering part of what the case enforces.
