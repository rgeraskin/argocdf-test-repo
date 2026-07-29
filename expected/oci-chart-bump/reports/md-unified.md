<!-- argocdf-diff -->
## ArgoCD Diff: master → case/oci-chart-bump

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/oci-podinfo

```diff
--- base/argocd/argoproj.io/Application/oci-podinfo
+++ target/argocd/argoproj.io/Application/oci-podinfo
@@ -13,7 +13,7 @@
         helm:
             skipTests: true
         repoURL: ghcr.io/stefanprodan/charts
-        targetRevision: 6.7.0
+        targetRevision: 6.7.1
     syncPolicy:
         automated: {}
         syncOptions:
```

</details>

<details>
<summary>Show diff for <b>oci-podinfo (argocd)</b> — 🟡~2</summary>

#### 📝 Service/oci-podinfo

```diff
--- base/Service/oci-podinfo
+++ target/Service/oci-podinfo
@@ -4,8 +4,8 @@
     labels:
         app.kubernetes.io/managed-by: Helm
         app.kubernetes.io/name: oci-podinfo
-        app.kubernetes.io/version: 6.7.0
-        helm.sh/chart: podinfo-6.7.0
+        app.kubernetes.io/version: 6.7.1
+        helm.sh/chart: podinfo-6.7.1
     name: oci-podinfo
 spec:
     ports:
```

#### 📝 apps/Deployment/oci-podinfo

```diff
--- base/apps/Deployment/oci-podinfo
+++ target/apps/Deployment/oci-podinfo
@@ -4,8 +4,8 @@
     labels:
         app.kubernetes.io/managed-by: Helm
         app.kubernetes.io/name: oci-podinfo
-        app.kubernetes.io/version: 6.7.0
-        helm.sh/chart: podinfo-6.7.0
+        app.kubernetes.io/version: 6.7.1
+        helm.sh/chart: podinfo-6.7.1
     name: oci-podinfo
 spec:
     replicas: 1
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
