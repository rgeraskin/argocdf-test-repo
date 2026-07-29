<!-- argocdf-diff -->
## ArgoCD Diff: master → case/combined-spec-and-values

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/podinfo-multisource

```diff
- spec.sources[0].targetRevision: 6.7.0
+ spec.sources[0].targetRevision: 6.7.1
```

</details>

<details>
<summary><b>podinfo-multisource (argocd)</b> 🟡~2</summary>

#### 📝 Service/podinfo-multisource

```diff
- metadata.labels.app.kubernetes.io/version: 6.7.0
+ metadata.labels.app.kubernetes.io/version: 6.7.1
- metadata.labels.helm.sh/chart: podinfo-6.7.0
+ metadata.labels.helm.sh/chart: podinfo-6.7.1
```

#### 📝 apps/Deployment/podinfo-multisource

```diff
- metadata.labels.app.kubernetes.io/version: 6.7.0
+ metadata.labels.app.kubernetes.io/version: 6.7.1
- metadata.labels.helm.sh/chart: podinfo-6.7.0
+ metadata.labels.helm.sh/chart: podinfo-6.7.1
- spec.replicas: 1
+ spec.replicas: 2
- spec.template.spec.containers[name=podinfo].image: ghcr.io/stefanprodan/podinfo:6.7.0
+ spec.template.spec.containers[name=podinfo].image: ghcr.io/stefanprodan/podinfo:6.7.1
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~3 resources

---
