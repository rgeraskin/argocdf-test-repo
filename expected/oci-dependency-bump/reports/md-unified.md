<!-- argocdf-diff -->
## ArgoCD Diff: master → case/oci-dependency-bump

<details>
<summary>Show diff for <b>umbrella-app (argocd)</b> — 🟡~2</summary>

#### 📝 Service/umbrella-app-ocidep

```diff
--- base/Service/umbrella-app-ocidep
+++ target/Service/umbrella-app-ocidep
@@ -4,8 +4,8 @@
     labels:
         app.kubernetes.io/managed-by: Helm
         app.kubernetes.io/name: umbrella-app-ocidep
-        app.kubernetes.io/version: 6.7.0
-        helm.sh/chart: ocidep-6.7.0
+        app.kubernetes.io/version: 6.7.1
+        helm.sh/chart: ocidep-6.7.1
     name: umbrella-app-ocidep
 spec:
     ports:
```

#### 📝 apps/Deployment/umbrella-app-ocidep

```diff
--- base/apps/Deployment/umbrella-app-ocidep
+++ target/apps/Deployment/umbrella-app-ocidep
@@ -4,8 +4,8 @@
     labels:
         app.kubernetes.io/managed-by: Helm
         app.kubernetes.io/name: umbrella-app-ocidep
-        app.kubernetes.io/version: 6.7.0
-        helm.sh/chart: ocidep-6.7.0
+        app.kubernetes.io/version: 6.7.1
+        helm.sh/chart: ocidep-6.7.1
     name: umbrella-app-ocidep
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

**Summary:** 1 applications affected | 1 changed | +0/-0/~2 resources

---
