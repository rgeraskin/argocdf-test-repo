<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-values-object

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-object

```diff
- spec.source.helm.valuesObject.greeting: from-object
+ spec.source.helm.valuesObject.greeting: object-updated
```

</details>

<details>
<summary><b>web-app-object (argocd)</b> 🟡~1</summary>

#### 📝 ConfigMap/web-app-object-cm

```diff
- data.greeting: from-object
+ data.greeting: object-updated
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
