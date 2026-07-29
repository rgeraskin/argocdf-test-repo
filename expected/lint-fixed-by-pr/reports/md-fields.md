<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-fixed-by-pr

<details>
<summary><b>kustomize-app (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/kust-web

```diff
- spec.template.spec.containers[name=web].image: nginx:latest
+ spec.template.spec.containers[name=web].image: nginx:1.27.0
```

</details>

<details>
<summary><b>kustomize-app-overrides (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/base-kust-web

```diff
- spec.template.spec.containers[name=web].image: nginx:latest
+ spec.template.spec.containers[name=web].image: nginx:1.27.0
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
