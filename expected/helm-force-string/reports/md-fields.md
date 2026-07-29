<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-force-string

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/typed-params

```diff
+ spec.source.helm.parameters[name=replicas].forceString: true
```

</details>

<details>
<summary><b>typed-params (argocd)</b> 🟡~1</summary>

#### 📝 apps/Deployment/typed-params-web

```diff
- metadata.labels.value-kind: int64
+ metadata.labels.value-kind: string
- spec.replicas: 2
+ spec.replicas: 2
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
