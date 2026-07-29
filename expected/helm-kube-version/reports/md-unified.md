<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-kube-version

<details>
<summary>Show diff for <b>cluster-info (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/cluster-info-cm

```diff
--- base/ConfigMap/cluster-info-cm
+++ target/ConfigMap/cluster-info-cm
@@ -1,7 +1,7 @@
 apiVersion: v1
 data:
     kubeVersion: v1.34.8
-    note: base
+    note: updated
 kind: ConfigMap
 metadata:
     name: cluster-info-cm
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
