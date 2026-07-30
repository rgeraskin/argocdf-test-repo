<!-- argocdf-diff -->
## ArgoCD Diff: master → case/kustomize-relative-base

<details>
<summary>Show diff for <b>kustomize-overlay (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/overlay-base-cm

```diff
--- base/ConfigMap/overlay-base-cm
+++ target/ConfigMap/overlay-base-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    origin: base
+    origin: edited
 kind: ConfigMap
 metadata:
     name: overlay-base-cm
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
