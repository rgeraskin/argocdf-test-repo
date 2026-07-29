<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-conftest

<details>
<summary>Show diff for <b>cluster-info (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [conftest/no_plaintext_credentials] ConfigMap/cluster-info-cm: data key &#34;note&#34; must not carry a plaintext credential

#### 📝 ConfigMap/cluster-info-cm

```diff
--- base/ConfigMap/cluster-info-cm
+++ target/ConfigMap/cluster-info-cm
@@ -1,7 +1,7 @@
 apiVersion: v1
 data:
     kubeVersion: v1.34.8
-    note: base
+    note: db connection password=placeholder
 kind: ConfigMap
 metadata:
     name: cluster-info-cm
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
