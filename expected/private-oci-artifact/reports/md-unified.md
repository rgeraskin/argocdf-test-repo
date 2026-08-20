<!-- argocdf-diff -->
## ArgoCD Diff: master → case/private-oci-artifact

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟢+1</summary>

#### ➕ argocd/argoproj.io/Application/private-artifact

```diff
--- base/argocd/argoproj.io/Application/private-artifact
+++ target/argocd/argoproj.io/Application/private-artifact
@@ -1 +1,19 @@
+apiVersion: argoproj.io/v1alpha1
+kind: Application
+metadata:
+    name: private-artifact
+    namespace: argocd
+spec:
+    destination:
+        namespace: default
+        server: https://kubernetes.default.svc
+    project: default
+    source:
+        path: .
+        repoURL: oci://127.0.0.1.nip.io:5317/charts/private-app
+        targetRevision: 0.1.0
+    syncPolicy:
+        automated: {}
+        syncOptions:
+            - CreateNamespace=true
 
```

</details>

<details>
<summary>Show diff for <b>private-artifact (argocd)</b> — 🟢+1</summary>

#### ➕ ConfigMap/private-app

```diff
--- base/ConfigMap/private-app
+++ target/ConfigMap/private-app
@@ -1 +1,8 @@
+apiVersion: v1
+data:
+    chartVersion: 0.1.0
+    message: hello-from-behind-auth
+kind: ConfigMap
+metadata:
+    name: private-app
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +2/-0/~0 resources

---
