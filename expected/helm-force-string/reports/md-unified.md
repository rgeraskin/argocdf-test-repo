<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-force-string

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/typed-params

```diff
--- base/argocd/argoproj.io/Application/typed-params
+++ target/argocd/argoproj.io/Application/typed-params
@@ -11,7 +11,8 @@
     source:
         helm:
             parameters:
-                - name: replicas
+                - forceString: true
+                  name: replicas
                   value: "2"
         path: apps/typed-params
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
```

</details>

<details>
<summary>Show diff for <b>typed-params (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/typed-params-web

```diff
--- base/apps/Deployment/typed-params-web
+++ target/apps/Deployment/typed-params-web
@@ -2,10 +2,10 @@
 kind: Deployment
 metadata:
     labels:
-        value-kind: int64
+        value-kind: string
     name: typed-params-web
 spec:
-    replicas: 2
+    replicas: "2"
     selector:
         matchLabels:
             app: typed-params
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
