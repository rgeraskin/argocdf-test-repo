<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-release-name

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-named

```diff
--- base/argocd/argoproj.io/Application/web-app-named
+++ target/argocd/argoproj.io/Application/web-app-named
@@ -10,7 +10,7 @@
     project: default
     source:
         helm:
-            releaseName: base-release
+            releaseName: renamed-release
         path: apps/web-app
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>web-app-named (argocd)</b> — 🟢+2 🔴-2</summary>

#### ➕ ConfigMap/renamed-release-cm

```diff
--- base/ConfigMap/renamed-release-cm
+++ target/ConfigMap/renamed-release-cm
@@ -1 +1,9 @@
+apiVersion: v1
+data:
+    greeting: from-values
+    namespace: default
+    numeric: fallback
+kind: ConfigMap
+metadata:
+    name: renamed-release-cm
 
```

#### ➕ apps/Deployment/renamed-release-web

```diff
--- base/apps/Deployment/renamed-release-web
+++ target/apps/Deployment/renamed-release-web
@@ -1 +1,18 @@
+apiVersion: apps/v1
+kind: Deployment
+metadata:
+    name: renamed-release-web
+spec:
+    replicas: 1
+    selector:
+        matchLabels:
+            app: renamed-release
+    template:
+        metadata:
+            labels:
+                app: renamed-release
+        spec:
+            containers:
+                - image: nginx:1.27.0
+                  name: web
 
```

#### ➖ ConfigMap/base-release-cm

```diff
--- base/ConfigMap/base-release-cm
+++ target/ConfigMap/base-release-cm
@@ -1,9 +1 @@
-apiVersion: v1
-data:
-    greeting: from-values
-    namespace: default
-    numeric: fallback
-kind: ConfigMap
-metadata:
-    name: base-release-cm
 
```

#### ➖ apps/Deployment/base-release-web

```diff
--- base/apps/Deployment/base-release-web
+++ target/apps/Deployment/base-release-web
@@ -1,18 +1 @@
-apiVersion: apps/v1
-kind: Deployment
-metadata:
-    name: base-release-web
-spec:
-    replicas: 1
-    selector:
-        matchLabels:
-            app: base-release
-    template:
-        metadata:
-            labels:
-                app: base-release
-        spec:
-            containers:
-                - image: nginx:1.27.0
-                  name: web
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +2/-2/~1 resources

---
