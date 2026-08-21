<!-- argocdf-diff -->
## ArgoCD Diff: master → case/plain-oci-artifact

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟢+1</summary>

#### ➕ argocd/argoproj.io/Application/plain-artifact

```diff
--- base/argocd/argoproj.io/Application/plain-artifact
+++ target/argocd/argoproj.io/Application/plain-artifact
@@ -1 +1,19 @@
+apiVersion: argoproj.io/v1alpha1
+kind: Application
+metadata:
+    name: plain-artifact
+    namespace: argocd
+spec:
+    destination:
+        namespace: default
+        server: https://kubernetes.default.svc
+    project: default
+    source:
+        path: manifests
+        repoURL: oci://127.0.0.1.nip.io:5317/artifacts/plain-app
+        targetRevision: 1.0.0
+    syncPolicy:
+        automated: {}
+        syncOptions:
+            - CreateNamespace=true
 
```

</details>

<details>
<summary>Show diff for <b>plain-artifact (argocd)</b> — 🟢+2</summary>

#### ➕ ConfigMap/plain-artifact-config

```diff
--- base/ConfigMap/plain-artifact-config
+++ target/ConfigMap/plain-artifact-config
@@ -1 +1,8 @@
+apiVersion: v1
+data:
+    layer: application/vnd.oci.image.layer.v1.tar+gzip
+    origin: oci-artifact-not-a-chart
+kind: ConfigMap
+metadata:
+    name: plain-artifact-config
 
```

#### ➕ Service/plain-artifact-svc

```diff
--- base/Service/plain-artifact-svc
+++ target/Service/plain-artifact-svc
@@ -1 +1,11 @@
+apiVersion: v1
+kind: Service
+metadata:
+    name: plain-artifact-svc
+spec:
+    ports:
+        - port: 80
+          targetPort: 8080
+    selector:
+        app: plain-artifact
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +3/-0/~0 resources

---
