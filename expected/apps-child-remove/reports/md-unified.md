<!-- argocdf-diff -->
## ArgoCD Diff: master → case/apps-child-remove

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🔴-1</summary>

#### ➖ argocd/argoproj.io/Application/plain-manifests

```diff
--- base/argocd/argoproj.io/Application/plain-manifests
+++ target/argocd/argoproj.io/Application/plain-manifests
@@ -1,19 +1 @@
-apiVersion: argoproj.io/v1alpha1
-kind: Application
-metadata:
-    name: plain-manifests
-    namespace: argocd
-spec:
-    destination:
-        namespace: default
-        server: https://kubernetes.default.svc
-    project: default
-    source:
-        path: apps/plain-manifests
-        repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
-        targetRevision: HEAD
-    syncPolicy:
-        automated: {}
-        syncOptions:
-            - CreateNamespace=true
 
```

</details>

<details>
<summary>Show diff for <b>plain-manifests (argocd)</b> — 🔴-2</summary>

#### ➖ ConfigMap/plain-a

```diff
--- base/ConfigMap/plain-a
+++ target/ConfigMap/plain-a
@@ -1,7 +1 @@
-apiVersion: v1
-data:
-    k: a
-kind: ConfigMap
-metadata:
-    name: plain-a
 
```

#### ➖ ConfigMap/plain-b

```diff
--- base/ConfigMap/plain-b
+++ target/ConfigMap/plain-b
@@ -1,7 +1 @@
-apiVersion: v1
-data:
-    k: b
-kind: ConfigMap
-metadata:
-    name: plain-b
 
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-3/~0 resources

---
