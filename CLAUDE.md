# CLAUDE.md

This repository is the argocdf end-to-end test artifact. Read README.md for the full architecture (fixtures, case branches, expected outputs, the apps-of-apps catalog, lint policies).

Key rules when working here:
- `case/<name>` branches are the test cases (one focused commit off master each); `expected/<name>/` on master holds both halves of that case's verification — `checks.grep` (AUTHORED from the case's intent, survives regeneration) and `reports/` (RECORDED argocdf output, wiped and rewritten by `--regenerate`). Never derive a checks pattern from generated output.
- The test HARNESS lives in the argocdf repo (`scripts/e2e/`); this repo holds only simulated-user-repo content plus the per-branch lint adapters (`scripts/lint-kyverno.sh`, `scripts/lint-conftest.sh`) and their policies under `policies/<tool>/`.
- On case branches `git add` only the files you changed — never `git add -A`.
- After changing master fixtures/catalog: rebase all case branches, regenerate all expectations, and review the diff like code. Publish with the argocdf repo's `mise run e2e:push` (rebases branches, pushes master, force-pushes branches, prunes remote `case/*` branches with no local counterpart).
- Adding a case: use the argocdf repo's `e2e-add-case` Claude skill.
- No company references anywhere; public charts only.
- Markdown files: never hard-wrap prose — one paragraph or list item = one source line (viewers word-wrap).
