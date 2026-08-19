<!-- argocdf-diff -->
## ArgoCD Diff: master → case/oci-artifact-spelling

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/oci-podinfo

```diff
- spec.source.chart: podinfo
+ spec.source.path: .
- spec.source.repoURL: ghcr.io/stefanprodan/charts
+ spec.source.repoURL: oci://ghcr.io/stefanprodan/charts/podinfo
```

</details>

<details>
<summary><b>oci-podinfo (argocd)</b></summary>

_No changes_

</details>

---

**Summary:** 2 applications affected | 1 changed | +0/-0/~1 resources

---
