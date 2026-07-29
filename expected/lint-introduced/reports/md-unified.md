<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-introduced

<details>
<summary>Show diff for <b>grandchild (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/grandchild-app-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/grandchild-app-web

```diff
--- base/apps/Deployment/grandchild-app-web
+++ target/apps/Deployment/grandchild-app-web
@@ -13,6 +13,6 @@
                 app: grandchild-app
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>web-app (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-web

```diff
--- base/apps/Deployment/web-app-web
+++ target/apps/Deployment/web-app-web
@@ -13,6 +13,6 @@
                 app: web-app
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>web-app-files (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-files-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-files-web

```diff
--- base/apps/Deployment/web-app-files-web
+++ target/apps/Deployment/web-app-files-web
@@ -13,6 +13,6 @@
                 app: web-app-files
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>web-app-inline (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-inline-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-inline-web

```diff
--- base/apps/Deployment/web-app-inline-web
+++ target/apps/Deployment/web-app-inline-web
@@ -13,6 +13,6 @@
                 app: web-app-inline
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>web-app-named (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/base-release-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/base-release-web

```diff
--- base/apps/Deployment/base-release-web
+++ target/apps/Deployment/base-release-web
@@ -13,6 +13,6 @@
                 app: base-release
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>web-app-ns (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-ns-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-ns-web

```diff
--- base/apps/Deployment/web-app-ns-web
+++ target/apps/Deployment/web-app-ns-web
@@ -13,6 +13,6 @@
                 app: web-app-ns
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>web-app-object (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-object-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-object-web

```diff
--- base/apps/Deployment/web-app-object-web
+++ target/apps/Deployment/web-app-object-web
@@ -13,6 +13,6 @@
                 app: web-app-object
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

<details>
<summary>Show diff for <b>web-app-params (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-params-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-params-web

```diff
--- base/apps/Deployment/web-app-params-web
+++ target/apps/Deployment/web-app-params-web
@@ -13,6 +13,6 @@
                 app: web-app-params
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:latest
                   name: web
 
```

</details>

---

**Summary:** 8 applications affected | 8 changed | +0/-0/~8 resources

---
