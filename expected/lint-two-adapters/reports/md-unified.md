<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-two-adapters

<details>
<summary>Show diff for <b>cluster-info (argocd)</b> — ⚠️2 🟢+1 🟡~1</summary>

> ⚠️ **2 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/cluster-info-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)
> - [target] [conftest/no_plaintext_credentials] ConfigMap/cluster-info-cm: data key &#34;note&#34; must not carry a plaintext credential

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
+                - image: nginx:latest
+                  name: web
 
```

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

**Summary:** 1 applications affected | 1 changed | +1/-0/~1 resources

---
