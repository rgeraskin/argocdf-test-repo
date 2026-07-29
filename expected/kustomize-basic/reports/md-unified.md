<!-- argocdf-diff -->
## ArgoCD Diff: master → case/kustomize-basic

<details>
<summary>Show diff for <b>kustomize-app (argocd)</b> — ⚠️2 🟡~1</summary>

> ⚠️ **2 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)
> - [target] [kyverno/disallow-latest-tag] Deployment/kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 ConfigMap/kust-cm

```diff
--- base/ConfigMap/kust-cm
+++ target/ConfigMap/kust-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    tier: basic
+    tier: advanced
 kind: ConfigMap
 metadata:
     name: kust-cm
```

</details>

<details>
<summary>Show diff for <b>kustomize-app-overrides (argocd)</b> — ⚠️2 🟡~1</summary>

> ⚠️ **2 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)
> - [target] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 ConfigMap/base-kust-cm

```diff
--- base/ConfigMap/base-kust-cm
+++ target/ConfigMap/base-kust-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    tier: basic
+    tier: advanced
 kind: ConfigMap
 metadata:
     name: base-kust-cm
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
