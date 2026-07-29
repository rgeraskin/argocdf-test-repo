<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-values-object

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-object

```diff
--- base/argocd/argoproj.io/Application/web-app-object
+++ target/argocd/argoproj.io/Application/web-app-object
@@ -11,7 +11,7 @@
     source:
         helm:
             valuesObject:
-                greeting: from-object
+                greeting: object-updated
         path: apps/web-app
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>web-app-object (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-object-cm

```diff
--- base/ConfigMap/web-app-object-cm
+++ target/ConfigMap/web-app-object-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    greeting: from-object
+    greeting: object-updated
     namespace: default
     numeric: fallback
 kind: ConfigMap
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
