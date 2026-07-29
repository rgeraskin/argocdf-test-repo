<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-template-edit

<details>
<summary>Show diff for <b>grandchild (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/grandchild-app-cm

```diff
--- base/ConfigMap/grandchild-app-cm
+++ target/ConfigMap/grandchild-app-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-grandchild
     namespace: default
     numeric: fallback
```

</details>

<details>
<summary>Show diff for <b>web-app (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-cm

```diff
--- base/ConfigMap/web-app-cm
+++ target/ConfigMap/web-app-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-values
     namespace: default
     numeric: fallback
```

</details>

<details>
<summary>Show diff for <b>web-app-files (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-files-cm

```diff
--- base/ConfigMap/web-app-files-cm
+++ target/ConfigMap/web-app-files-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-override-file
     namespace: default
     numeric: fallback
```

</details>

<details>
<summary>Show diff for <b>web-app-inline (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-inline-cm

```diff
--- base/ConfigMap/web-app-inline-cm
+++ target/ConfigMap/web-app-inline-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-inline
     namespace: default
     numeric: fallback
```

</details>

<details>
<summary>Show diff for <b>web-app-named (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/base-release-cm

```diff
--- base/ConfigMap/base-release-cm
+++ target/ConfigMap/base-release-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-values
     namespace: default
     numeric: fallback
```

</details>

<details>
<summary>Show diff for <b>web-app-ns (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-ns-cm

```diff
--- base/ConfigMap/web-app-ns-cm
+++ target/ConfigMap/web-app-ns-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-values
     namespace: base-ns
     numeric: fallback
```

</details>

<details>
<summary>Show diff for <b>web-app-object (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-object-cm

```diff
--- base/ConfigMap/web-app-object-cm
+++ target/ConfigMap/web-app-object-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-object
     namespace: default
     numeric: fallback
```

</details>

<details>
<summary>Show diff for <b>web-app-params (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-params-cm

```diff
--- base/ConfigMap/web-app-params-cm
+++ target/ConfigMap/web-app-params-cm
@@ -1,5 +1,6 @@
 apiVersion: v1
 data:
+    edited: "yes"
     greeting: from-param
     namespace: default
     numeric: "0123"
```

</details>

---

**Summary:** 8 applications affected | 8 changed | +0/-0/~8 resources

---
