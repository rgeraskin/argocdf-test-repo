<!-- argocdf-diff -->
## ArgoCD Diff: master → case/fileparam-rollout

<details>
<summary>Show diff for <b>versioned-app (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/versioned-app-web

```diff
--- base/apps/Deployment/versioned-app-web
+++ target/apps/Deployment/versioned-app-web
@@ -12,6 +12,6 @@
                 app: versioned-app
         spec:
             containers:
-                - image: nginx:1.27.0
+                - image: nginx:1.27.1
                   name: web
 
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
