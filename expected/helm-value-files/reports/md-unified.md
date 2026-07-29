<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-value-files

<details>
<summary>Show diff for <b>grandchild (argocd)</b></summary>

_No changes_

</details>

<details>
<summary>Show diff for <b>web-app (argocd)</b></summary>

_No changes_

</details>

<details>
<summary>Show diff for <b>web-app-files (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-files-cm

```diff
--- base/ConfigMap/web-app-files-cm
+++ target/ConfigMap/web-app-files-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    greeting: from-override-file
+    greeting: override-updated
     namespace: default
     numeric: fallback
 kind: ConfigMap
```

</details>

<details>
<summary>Show diff for <b>web-app-inline (argocd)</b></summary>

_No changes_

</details>

<details>
<summary>Show diff for <b>web-app-named (argocd)</b></summary>

_No changes_

</details>

<details>
<summary>Show diff for <b>web-app-ns (argocd)</b></summary>

_No changes_

</details>

<details>
<summary>Show diff for <b>web-app-object (argocd)</b></summary>

_No changes_

</details>

<details>
<summary>Show diff for <b>web-app-params (argocd)</b></summary>

_No changes_

</details>

---

**Summary:** 8 applications affected | 1 changed | +0/-0/~1 resources

---
