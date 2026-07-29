<!-- argocdf-diff -->
## ArgoCD Diff: master → case/kustomize-overrides

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/kustomize-app-overrides

```diff
--- base/argocd/argoproj.io/Application/kustomize-app-overrides
+++ target/argocd/argoproj.io/Application/kustomize-app-overrides
@@ -10,7 +10,12 @@
     project: default
     source:
         kustomize:
-            namePrefix: base-
+            commonLabels:
+                team: platform
+            images:
+                - nginx=nginx:1.27.1
+            namePrefix: pre-
+            namespace: production
         path: apps/kustomize-app
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>kustomize-app-overrides (argocd)</b> — ⚠️1 🟢+2 🔴-2</summary>

> ⚠️ **1 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### ➕ production/ConfigMap/pre-kust-cm

```diff
--- base/production/ConfigMap/pre-kust-cm
+++ target/production/ConfigMap/pre-kust-cm
@@ -1 +1,10 @@
+apiVersion: v1
+data:
+    tier: basic
+kind: ConfigMap
+metadata:
+    labels:
+        team: platform
+    name: pre-kust-cm
+    namespace: production
 
```

#### ➕ production/apps/Deployment/pre-kust-web

```diff
--- base/production/apps/Deployment/pre-kust-web
+++ target/production/apps/Deployment/pre-kust-web
@@ -1 +1,22 @@
+apiVersion: apps/v1
+kind: Deployment
+metadata:
+    labels:
+        team: platform
+    name: pre-kust-web
+    namespace: production
+spec:
+    selector:
+        matchLabels:
+            app: kust
+            team: platform
+    template:
+        metadata:
+            labels:
+                app: kust
+                team: platform
+        spec:
+            containers:
+                - image: nginx:1.27.1
+                  name: web
 
```

#### ➖ ConfigMap/base-kust-cm

```diff
--- base/ConfigMap/base-kust-cm
+++ target/ConfigMap/base-kust-cm
@@ -1,7 +1 @@
-apiVersion: v1
-data:
-    tier: basic
-kind: ConfigMap
-metadata:
-    name: base-kust-cm
 
```

#### ➖ apps/Deployment/base-kust-web

```diff
--- base/apps/Deployment/base-kust-web
+++ target/apps/Deployment/base-kust-web
@@ -1,17 +1 @@
-apiVersion: apps/v1
-kind: Deployment
-metadata:
-    name: base-kust-web
-spec:
-    selector:
-        matchLabels:
-            app: kust
-    template:
-        metadata:
-            labels:
-                app: kust
-        spec:
-            containers:
-                - image: nginx:latest
-                  name: web
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +2/-2/~1 resources

---
