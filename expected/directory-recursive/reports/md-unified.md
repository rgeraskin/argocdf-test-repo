<!-- argocdf-diff -->
## ArgoCD Diff: master → case/directory-recursive

<details>
<summary>Show diff for <b>nested-manifests (argocd)</b> — 🟡~2</summary>

#### 📝 ConfigMap/rec-hidden

```diff
--- base/ConfigMap/rec-hidden
+++ target/ConfigMap/rec-hidden
@@ -1,6 +1,6 @@
 apiVersion: v1
 data:
-    k: hidden
+    k: hidden2
 kind: ConfigMap
 metadata:
     name: rec-hidden
```

#### 📝 Secret/rec-nested

```diff
--- base/Secret/rec-nested
+++ target/Secret/rec-nested
@@ -3,5 +3,5 @@
 metadata:
     name: rec-nested
 stringData:
-    k: nested
+    k: nested2
 
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~2 resources

---
