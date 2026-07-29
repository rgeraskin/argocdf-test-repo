<!-- argocdf-diff -->
## ArgoCD Diff: master → case/kustomize-basic

<details>
<summary><b>kustomize-app (argocd)</b> ⚠️ 2 warning(s) 🟡~1</summary>

> ⚠️ **2 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)
> - [target] [kyverno/disallow-latest-tag] Deployment/kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 ConfigMap/kust-cm

```diff
- data.tier: basic
+ data.tier: advanced
```

</details>

<details>
<summary><b>kustomize-app-overrides (argocd)</b> ⚠️ 2 warning(s) 🟡~1</summary>

> ⚠️ **2 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)
> - [target] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 ConfigMap/base-kust-cm

```diff
- data.tier: basic
+ data.tier: advanced
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
