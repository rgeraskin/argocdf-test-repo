<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-inline-values

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-inline

```diff
- spec.source.helm.values: greeting: from-inline

+ spec.source.helm.values: greeting: inline-updated

```

</details>

<details>
<summary><b>web-app-inline (argocd)</b> 🟡~1</summary>

#### 📝 ConfigMap/web-app-inline-cm

```diff
- data.greeting: from-inline
+ data.greeting: inline-updated
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
