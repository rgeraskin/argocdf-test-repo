<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-builtin-cr

<details>
<summary>Show diff for <b>root-app (argocd)</b> — ⚠️1 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-kube-system-apps] Application/web-app-ns: Applications must not deploy into the kube-system namespace

#### 📝 argocd/argoproj.io/Application/web-app-ns

```diff
--- base/argocd/argoproj.io/Application/web-app-ns
+++ target/argocd/argoproj.io/Application/web-app-ns
@@ -5,7 +5,7 @@
     namespace: argocd
 spec:
     destination:
-        namespace: base-ns
+        namespace: kube-system
         server: https://kubernetes.default.svc
     project: default
     source:
```

</details>

<details>
<summary>Show diff for <b>web-app-ns (argocd)</b> — 🟡~1</summary>

#### 📝 ConfigMap/web-app-ns-cm

```diff
--- base/ConfigMap/web-app-ns-cm
+++ target/ConfigMap/web-app-ns-cm
@@ -1,7 +1,7 @@
 apiVersion: v1
 data:
     greeting: from-values
-    namespace: base-ns
+    namespace: kube-system
     numeric: fallback
 kind: ConfigMap
 metadata:
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
