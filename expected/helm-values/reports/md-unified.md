<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-values

<details>
<summary>Show diff for <b>grandchild (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/grandchild-app-web

```diff
--- base/apps/Deployment/grandchild-app-web
+++ target/apps/Deployment/grandchild-app-web
@@ -3,7 +3,7 @@
 metadata:
     name: grandchild-app-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: grandchild-app
```

</details>

<details>
<summary>Show diff for <b>web-app (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/web-app-web

```diff
--- base/apps/Deployment/web-app-web
+++ target/apps/Deployment/web-app-web
@@ -3,7 +3,7 @@
 metadata:
     name: web-app-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: web-app
```

</details>

<details>
<summary>Show diff for <b>web-app-files (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/web-app-files-web

```diff
--- base/apps/Deployment/web-app-files-web
+++ target/apps/Deployment/web-app-files-web
@@ -3,7 +3,7 @@
 metadata:
     name: web-app-files-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: web-app-files
```

</details>

<details>
<summary>Show diff for <b>web-app-inline (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/web-app-inline-web

```diff
--- base/apps/Deployment/web-app-inline-web
+++ target/apps/Deployment/web-app-inline-web
@@ -3,7 +3,7 @@
 metadata:
     name: web-app-inline-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: web-app-inline
```

</details>

<details>
<summary>Show diff for <b>web-app-named (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/base-release-web

```diff
--- base/apps/Deployment/base-release-web
+++ target/apps/Deployment/base-release-web
@@ -3,7 +3,7 @@
 metadata:
     name: base-release-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: base-release
```

</details>

<details>
<summary>Show diff for <b>web-app-ns (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/web-app-ns-web

```diff
--- base/apps/Deployment/web-app-ns-web
+++ target/apps/Deployment/web-app-ns-web
@@ -3,7 +3,7 @@
 metadata:
     name: web-app-ns-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: web-app-ns
```

</details>

<details>
<summary>Show diff for <b>web-app-object (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/web-app-object-web

```diff
--- base/apps/Deployment/web-app-object-web
+++ target/apps/Deployment/web-app-object-web
@@ -3,7 +3,7 @@
 metadata:
     name: web-app-object-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: web-app-object
```

</details>

<details>
<summary>Show diff for <b>web-app-params (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/web-app-params-web

```diff
--- base/apps/Deployment/web-app-params-web
+++ target/apps/Deployment/web-app-params-web
@@ -3,7 +3,7 @@
 metadata:
     name: web-app-params-web
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app: web-app-params
```

</details>

---

**Summary:** 8 applications affected | 8 changed | +0/-0/~8 resources

---
