<!-- argocdf-diff -->
## ArgoCD Diff: master → case/oci-chart-bump

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/oci-podinfo

```diff
- spec.source.targetRevision: 6.7.0
+ spec.source.targetRevision: 6.7.1
```

</details>

<details>
<summary><b>oci-podinfo (argocd)</b> 🟡~2</summary>

#### 📝 Service/oci-podinfo

```diff
- metadata.labels.app.kubernetes.io/version: 6.7.0
+ metadata.labels.app.kubernetes.io/version: 6.7.1
- metadata.labels.helm.sh/chart: podinfo-6.7.0
+ metadata.labels.helm.sh/chart: podinfo-6.7.1
```

#### 📝 apps/Deployment/oci-podinfo

```diff
- metadata.labels.app.kubernetes.io/version: 6.7.0
+ metadata.labels.app.kubernetes.io/version: 6.7.1
- metadata.labels.helm.sh/chart: podinfo-6.7.0
+ metadata.labels.helm.sh/chart: podinfo-6.7.1
- spec.template.spec.containers[name=podinfo].image: ghcr.io/stefanprodan/podinfo:6.7.0
+ spec.template.spec.containers[name=podinfo].image: ghcr.io/stefanprodan/podinfo:6.7.1
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~3 resources

---
