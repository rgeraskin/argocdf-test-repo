<!-- argocdf-diff -->
## ArgoCD Diff: master → case/external-repo-source

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/external-podinfo

```diff
- spec.source.targetRevision: 6.7.0
+ spec.source.targetRevision: 6.8.0
```

</details>

<details>
<summary><b>external-podinfo (argocd)</b> 🟡~1</summary>

#### 📝 apps/Deployment/podinfo

```diff
- spec.template.spec.containers[name=podinfod].image: ghcr.io/stefanprodan/podinfo:6.7.0
+ spec.template.spec.containers[name=podinfod].image: ghcr.io/stefanprodan/podinfo:6.8.0
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
