<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-inline-values

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-inline

```diff
--- base/argocd/argoproj.io/Application/web-app-inline
+++ target/argocd/argoproj.io/Application/web-app-inline
@@ -11,7 +11,7 @@
     source:
         helm:
             values: |
-                greeting: from-inline
+                greeting: inline-updated
         path: apps/web-app
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>web-app-inline (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-inline-cm

```diff
--- base/ConfigMap/web-app-inline-cm
+++ target/ConfigMap/web-app-inline-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    greeting: from-inline
+    greeting: inline-updated
     namespace: default
     numeric: fallback
 kind: ConfigMap
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
