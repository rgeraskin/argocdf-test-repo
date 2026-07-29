<!-- argocdf-diff -->
## ArgoCD Diff: master → case/external-repo-source

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/external-podinfo

```diff
--- base/argocd/argoproj.io/Application/external-podinfo
+++ target/argocd/argoproj.io/Application/external-podinfo
@@ -11,7 +11,7 @@
     source:
         path: kustomize
         repoURL: https://github.com/stefanprodan/podinfo.git
-        targetRevision: 6.7.0
+        targetRevision: 6.8.0
     syncPolicy:
         automated: {}
         syncOptions:
```

</details>

<details>
<summary>Show diff for <b>external-podinfo (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/podinfo

```diff
--- base/apps/Deployment/podinfo
+++ target/apps/Deployment/podinfo
@@ -34,7 +34,7 @@
                   env:
                     - name: PODINFO_UI_COLOR
                       value: '#34577c'
-                  image: ghcr.io/stefanprodan/podinfo:6.7.0
+                  image: ghcr.io/stefanprodan/podinfo:6.8.0
                   imagePullPolicy: IfNotPresent
                   livenessProbe:
                     exec:
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
