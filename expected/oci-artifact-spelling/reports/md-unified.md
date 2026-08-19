<!-- argocdf-diff -->
## ArgoCD Diff: master → case/oci-artifact-spelling

<details>
<summary>Show diff for <b>root-app (argocd)</b> — 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/oci-podinfo

```diff
--- base/argocd/argoproj.io/Application/oci-podinfo
+++ target/argocd/argoproj.io/Application/oci-podinfo
@@ -9,10 +9,10 @@
         server: https://kubernetes.default.svc
     project: default
     source:
-        chart: podinfo
         helm:
             skipTests: true
-        repoURL: ghcr.io/stefanprodan/charts
+        path: .
+        repoURL: oci://ghcr.io/stefanprodan/charts/podinfo
         targetRevision: 6.7.0
     syncPolicy:
         automated: {}
```

</details>

<details>
<summary>Show diff for <b>oci-podinfo (argocd)</b></summary>

_No changes_

</details>

---

**Summary:** 2 applications affected | 1 changed | +0/-0/~1 resources

---
