<!-- argocdf-diff -->
## ArgoCD Diff: master → case/classic-dependency-bump

<details>
<summary><b>umbrella-app (argocd)</b> 🟡~2</summary>

#### 📝 Service/umbrella-app-classicdep

```diff
- metadata.labels.app.kubernetes.io/version: 6.7.0
+ metadata.labels.app.kubernetes.io/version: 6.7.1
- metadata.labels.helm.sh/chart: classicdep-6.7.0
+ metadata.labels.helm.sh/chart: classicdep-6.7.1
```

#### 📝 apps/Deployment/umbrella-app-classicdep

```diff
- metadata.labels.app.kubernetes.io/version: 6.7.0
+ metadata.labels.app.kubernetes.io/version: 6.7.1
- metadata.labels.helm.sh/chart: classicdep-6.7.0
+ metadata.labels.helm.sh/chart: classicdep-6.7.1
- spec.template.spec.containers[name=classicdep].image: ghcr.io/stefanprodan/podinfo:6.7.0
+ spec.template.spec.containers[name=classicdep].image: ghcr.io/stefanprodan/podinfo:6.7.1
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~2 resources

---
