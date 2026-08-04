<!-- argocdf-diff -->
## ArgoCD Diff: master → case/private-chart-unauth

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/private-app

```diff
--- base/argocd/argoproj.io/Application/private-app
+++ target/argocd/argoproj.io/Application/private-app
@@ -11,7 +11,7 @@
     source:
         chart: private-app
         repoURL: 127.0.0.1.nip.io:5317/charts
-        targetRevision: 0.1.0
+        targetRevision: 0.2.0
     syncPolicy:
         automated: {}
         syncOptions:
```

</details>

<details>
<summary>Show diff for <b>private-app (argocd)</b> — ❌</summary>

> ⚠️ failed to render base branch: failed to render source 0: failed to fetch helm chart private-app from 127.0.0.1.nip.io:5317/charts: error pulling OCI chart: failed to pull OCI chart: failed to get command args to log: `helm pull oci://127.0.0.1.nip.io:5317/charts/private-app --version 0.1.0 --destination (temp dir)` failed exit status 1: Error: failed to perform &#34;FetchReference&#34; on source: Get &#34;https://127.0.0.1.nip.io:5317/v2/charts/private-app/manifests/0.1.0&#34;: tls: failed to verify certificate: <platform-specific>

</details>

---

**Summary:** 2 applications affected | 1 changed | +0/-0/~1 resources | 1 errors

---
