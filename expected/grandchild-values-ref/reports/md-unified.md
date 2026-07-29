<!-- argocdf-diff -->
## ArgoCD Diff: master → case/grandchild-values-ref

<details>
<summary>Show diff for <b>grandchild-ref (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/grandchild-ref-app-cm

```diff
--- base/ConfigMap/grandchild-ref-app-cm
+++ target/ConfigMap/grandchild-ref-app-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    greeting: from-grandchild-ref
+    greeting: ref-updated-grandchild
 kind: ConfigMap
 metadata:
     name: grandchild-ref-app-cm
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
