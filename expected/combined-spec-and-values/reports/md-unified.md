<!-- argocdf-diff -->
## ArgoCD Diff: master → case/combined-spec-and-values

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/podinfo-multisource

```diff
--- base/argocd/argoproj.io/Application/podinfo-multisource
+++ target/argocd/argoproj.io/Application/podinfo-multisource
@@ -15,7 +15,7 @@
             valueFiles:
                 - $cvals/apps/podinfo-values/podinfo-values.yaml
           repoURL: ghcr.io/stefanprodan/charts
-          targetRevision: 6.7.0
+          targetRevision: 6.7.1
         - ref: cvals
           repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
           targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>podinfo-multisource (argocd)</b> — 🟡~2</summary>

#### 📝 Service/podinfo-multisource

```diff
--- base/Service/podinfo-multisource
+++ target/Service/podinfo-multisource
@@ -4,8 +4,8 @@
     labels:
         app.kubernetes.io/managed-by: Helm
         app.kubernetes.io/name: podinfo-multisource
-        app.kubernetes.io/version: 6.7.0
-        helm.sh/chart: podinfo-6.7.0
+        app.kubernetes.io/version: 6.7.1
+        helm.sh/chart: podinfo-6.7.1
     name: podinfo-multisource
 spec:
     ports:
```

#### 📝 apps/Deployment/podinfo-multisource

```diff
--- base/apps/Deployment/podinfo-multisource
+++ target/apps/Deployment/podinfo-multisource
@@ -4,11 +4,11 @@
     labels:
         app.kubernetes.io/managed-by: Helm
         app.kubernetes.io/name: podinfo-multisource
-        app.kubernetes.io/version: 6.7.0
-        helm.sh/chart: podinfo-6.7.0
+        app.kubernetes.io/version: 6.7.1
+        helm.sh/chart: podinfo-6.7.1
     name: podinfo-multisource
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app.kubernetes.io/name: podinfo-multisource
@@ -38,7 +38,7 @@
                   env:
                     - name: PODINFO_UI_COLOR
                       value: '#34577c'
-                  image: ghcr.io/stefanprodan/podinfo:6.7.0
+                  image: ghcr.io/stefanprodan/podinfo:6.7.1
                   imagePullPolicy: IfNotPresent
                   livenessProbe:
                     exec:
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~3 resources

---
