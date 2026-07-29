<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-fixed-by-pr

<details>
<summary>Show diff for <b>kustomize-app (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/kust-web

```diff
--- base/apps/Deployment/kust-web
+++ target/apps/Deployment/kust-web
@@ -12,6 +12,6 @@
                 app: kust
         spec:
             containers:
-                - image: nginx:latest
+                - image: nginx:1.27.0
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>kustomize-app-overrides (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/base-kust-web

```diff
--- base/apps/Deployment/base-kust-web
+++ target/apps/Deployment/base-kust-web
@@ -12,6 +12,6 @@
                 app: kust
         spec:
             containers:
-                - image: nginx:latest
+                - image: nginx:1.27.0
                   name: web
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
