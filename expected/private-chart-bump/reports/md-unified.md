<!-- argocdf-diff -->
## ArgoCD Diff: master → case/private-chart-bump

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/private-app

```diff
--- base/argocd/argoproj.io/Application/private-app
+++ target/argocd/argoproj.io/Application/private-app
@@ -11,7 +11,7 @@
     source:
         chart: private-app
         repoURL: 127.0.0.1.nip.io:5317/charts
-        targetRevision: 0.1.0
+        targetRevision: 0.2.0
     syncPolicy:
         automated: {}
         syncOptions:
```

</details>

<details>
<summary>Show diff for <b>private-app (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/private-app

```diff
--- base/ConfigMap/private-app
+++ target/ConfigMap/private-app
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    chartVersion: 0.1.0
+    chartVersion: 0.2.0
     message: hello-from-behind-auth
 kind: ConfigMap
 metadata:
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
