<!-- argocdf-diff -->
## ArgoCD Diff: master → case/shared-chart-edit

<details>
<summary>Show diff for <b>service-alpha (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/service-alpha-svc-cm

```diff
--- base/ConfigMap/service-alpha-svc-cm
+++ target/ConfigMap/service-alpha-svc-cm
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    tier: standard
+    tier: enhanced
 kind: ConfigMap
 metadata:
     name: service-alpha-svc-cm
```

</details>

<details>
<summary>Show diff for <b>service-beta (argocd)</b></summary>

_No changes_

</details>

---

**Summary:** 2 applications affected | 1 changed | +0/-0/~1 resources

---
