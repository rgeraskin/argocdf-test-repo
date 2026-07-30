<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-values-outside

<details>
<summary>Show diff for <b>shared-values-app (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/shared-values-app-cm

```diff
--- base/ConfigMap/shared-values-app-cm
+++ target/ConfigMap/shared-values-app-cm
@@ -1,7 +1,7 @@
 apiVersion: v1
 data:
     owner: local
-    sharedNote: from-shared-values
+    sharedNote: from-shared-values-updated
 kind: ConfigMap
 metadata:
     name: shared-values-app-cm
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
