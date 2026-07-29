<!-- argocdf-diff -->
## ArgoCD Diff: master → case/apps-child-spec-change

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app

```diff
--- base/argocd/argoproj.io/Application/web-app
+++ target/argocd/argoproj.io/Application/web-app
@@ -9,7 +9,7 @@
         server: https://kubernetes.default.svc
     project: default
     source:
-        path: apps/web-app
+        path: apps/widget-operator
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
     syncPolicy:
```

</details>

<details>
<summary>Show diff for <b>web-app (argocd)</b> — 🟢+1 🔴-1 🟡~1</summary>

#### ➕ apiextensions.k8s.io/CustomResourceDefinition/widgets.example.com

```diff
--- base/apiextensions.k8s.io/CustomResourceDefinition/widgets.example.com
+++ target/apiextensions.k8s.io/CustomResourceDefinition/widgets.example.com
@@ -1 +1,18 @@
+apiVersion: apiextensions.k8s.io/v1
+kind: CustomResourceDefinition
+metadata:
+    name: widgets.example.com
+spec:
+    group: example.com
+    names:
+        kind: Widget
+        plural: widgets
+    scope: Namespaced
+    versions:
+        - name: v1
+          schema:
+            openAPIV3Schema:
+                type: object
+          served: true
+          storage: true
 
```

#### ➖ apps/Deployment/web-app-web

```diff
--- base/apps/Deployment/web-app-web
+++ target/apps/Deployment/web-app-web
@@ -1,18 +1 @@
-apiVersion: apps/v1
-kind: Deployment
-metadata:
-    name: web-app-web
-spec:
-    replicas: 1
-    selector:
-        matchLabels:
-            app: web-app
-    template:
-        metadata:
-            labels:
-                app: web-app
-        spec:
-            containers:
-                - image: nginx:1.27.0
-                  name: web
 
```

#### 📝 ConfigMap/web-app-cm

```diff
--- base/ConfigMap/web-app-cm
+++ target/ConfigMap/web-app-cm
@@ -1,9 +1,9 @@
 apiVersion: v1
 data:
-    greeting: from-values
-    namespace: default
-    numeric: fallback
+    color: blue
 kind: ConfigMap
 metadata:
+    labels:
+        chart-version: 1.0.0
     name: web-app-cm
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +1/-1/~2 resources

---
