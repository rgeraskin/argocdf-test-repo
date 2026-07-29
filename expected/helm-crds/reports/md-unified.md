<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-crds

<details>
<summary>Show diff for <b>widget-operator (argocd)</b> — 🟡~2</summary>

#### 📝 ConfigMap/widget-operator-cm

```diff
--- base/ConfigMap/widget-operator-cm
+++ target/ConfigMap/widget-operator-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    color: blue
+    color: red
 kind: ConfigMap
 metadata:
     labels:
```

#### 📝 apiextensions.k8s.io/CustomResourceDefinition/widgets.example.com

```diff
--- base/apiextensions.k8s.io/CustomResourceDefinition/widgets.example.com
+++ target/apiextensions.k8s.io/CustomResourceDefinition/widgets.example.com
@@ -7,7 +7,7 @@
     names:
         kind: Widget
         plural: widgets
-    scope: Namespaced
+    scope: Cluster
     versions:
         - name: v1
           schema:
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~2 resources

---
