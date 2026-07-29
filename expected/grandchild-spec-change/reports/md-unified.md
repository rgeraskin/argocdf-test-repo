<!-- argocdf-diff -->
## ArgoCD Diff: master → case/grandchild-spec-change

<details>
<summary>Show diff for <b>nested-apps (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/grandchild

```diff
--- base/argocd/argoproj.io/Application/grandchild
+++ target/argocd/argoproj.io/Application/grandchild
@@ -12,7 +12,7 @@
         helm:
             releaseName: grandchild-app
             values: |
-                greeting: from-grandchild
+                greeting: grandchild-updated
         path: apps/web-app
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>grandchild (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/grandchild-app-cm

```diff
--- base/ConfigMap/grandchild-app-cm
+++ target/ConfigMap/grandchild-app-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    greeting: from-grandchild
+    greeting: grandchild-updated
     namespace: default
     numeric: fallback
 kind: ConfigMap
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
