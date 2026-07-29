<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-schema-fail

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/schema-app

```diff
--- base/argocd/argoproj.io/Application/schema-app
+++ target/argocd/argoproj.io/Application/schema-app
@@ -9,8 +9,6 @@
         server: https://kubernetes.default.svc
     project: default
     source:
-        helm:
-            skipSchemaValidation: true
         path: apps/schema-app
         repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
         targetRevision: HEAD
```

</details>

<details>
<summary>Show diff for <b>schema-app (argocd)</b> — ❌</summary>

> ⚠️ failed to render target branch: failed to render source 0: failed to execute helm template command: failed to get command args to log: `helm template . --name-template schema-app --namespace default --kube-version 1.34.8 &lt;api versions removed&gt; --include-crds` failed exit status 1: Error: values don&#39;t meet the specifications of the schema(s) in the following chart(s):
> schema-app:
> - at &#39;/replicas&#39;: got string, want integer

</details>

---

**Summary:** 2 applications affected | 1 changed | +0/-0/~1 resources | 1 errors

---
