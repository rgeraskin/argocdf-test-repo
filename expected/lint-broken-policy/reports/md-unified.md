<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-broken-policy

<details>
<summary>Show diff for <b>cluster-info (argocd)</b> — ⚠️1 🟢+1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/broken-expression] ERROR Deployment/cluster-info-web: expression &#39;object.spec.nonexistentField == &#39;whatever&#39;&#39; resulted in error: no such key: nonexistentField

#### ➕ apps/Deployment/cluster-info-web

```diff
--- base/apps/Deployment/cluster-info-web
+++ target/apps/Deployment/cluster-info-web
@@ -1 +1,18 @@
+apiVersion: apps/v1
+kind: Deployment
+metadata:
+    name: cluster-info-web
+spec:
+    replicas: 1
+    selector:
+        matchLabels:
+            app: cluster-info
+    template:
+        metadata:
+            labels:
+                app: cluster-info
+        spec:
+            containers:
+                - image: nginx:1.27.0
+                  name: web
 
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +1/-0/~0 resources

---
