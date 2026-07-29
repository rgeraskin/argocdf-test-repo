<!-- argocdf-diff -->
## ArgoCD Diff: master → case/multisource-values-ref

<details>
<summary>Show diff for <b>greeter (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/greeter-cm

```diff
--- base/ConfigMap/greeter-cm
+++ target/ConfigMap/greeter-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    greeting: from-ref-file
+    greeting: ref-updated
 kind: ConfigMap
 metadata:
     name: greeter-cm
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
