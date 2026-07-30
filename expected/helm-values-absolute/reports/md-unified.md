<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-values-absolute

<details>
<summary>Show diff for <b>absolute-values-app (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/absolute-values-app-cm

```diff
--- base/ConfigMap/absolute-values-app-cm
+++ target/ConfigMap/absolute-values-app-cm
@@ -1,7 +1,7 @@
 apiVersion: v1
 data:
     owner: local
-    sharedNote: from-absolute-path
+    sharedNote: from-absolute-path-updated
 kind: ConfigMap
 metadata:
     name: absolute-values-app-cm
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
