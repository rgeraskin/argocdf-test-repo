<!-- argocdf-diff -->
## ArgoCD Diff: master → case/apps-child-add

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟢+1</summary>

#### ➕ argocd/argoproj.io/Application/child-added

```diff
--- base/argocd/argoproj.io/Application/child-added
+++ target/argocd/argoproj.io/Application/child-added
@@ -1 +1,22 @@
+apiVersion: argoproj.io/v1alpha1
+kind: Application
+metadata:
+    name: child-added
+    namespace: argocd
+spec:
+    destination:
+        namespace: default
+        server: https://kubernetes.default.svc
+    project: default
+    source:
+        helm:
+            values: |
+                greeting: added-child
+        path: apps/web-app
+        repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
+        targetRevision: HEAD
+    syncPolicy:
+        automated: {}
+        syncOptions:
+            - CreateNamespace=true
 
```

</details>

<details>
<summary>Show diff for <b>child-added (argocd)</b> — 🟢+2</summary>

#### ➕ ConfigMap/child-added-cm

```diff
--- base/ConfigMap/child-added-cm
+++ target/ConfigMap/child-added-cm
@@ -1 +1,9 @@
+apiVersion: v1
+data:
+    greeting: added-child
+    namespace: default
+    numeric: fallback
+kind: ConfigMap
+metadata:
+    name: child-added-cm
 
```

#### ➕ apps/Deployment/child-added-web

```diff
--- base/apps/Deployment/child-added-web
+++ target/apps/Deployment/child-added-web
@@ -1 +1,18 @@
+apiVersion: apps/v1
+kind: Deployment
+metadata:
+    name: child-added-web
+spec:
+    replicas: 1
+    selector:
+        matchLabels:
+            app: child-added
+    template:
+        metadata:
+            labels:
+                app: child-added
+        spec:
+            containers:
+                - image: nginx:1.27.0
+                  name: web
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +3/-0/~0 resources

---
