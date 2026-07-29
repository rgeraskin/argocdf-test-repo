<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-parameters

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-params

```diff
--- base/argocd/argoproj.io/Application/web-app-params
+++ target/argocd/argoproj.io/Application/web-app-params
@@ -12,9 +12,9 @@
         helm:
             parameters:
                 - name: greeting
-                  value: from-param
+                  value: param-updated
                 - name: numeric
-                  value: "0123"
+                  value: "0456"
         path: apps/web-app
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>web-app-params (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-params-cm

```diff
--- base/ConfigMap/web-app-params-cm
+++ target/ConfigMap/web-app-params-cm
@@ -1,8 +1,8 @@
 apiVersion: v1
 data:
-    greeting: from-param
+    greeting: param-updated
     namespace: default
-    numeric: "0123"
+    numeric: "0456"
 kind: ConfigMap
 metadata:
     name: web-app-params-cm
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
