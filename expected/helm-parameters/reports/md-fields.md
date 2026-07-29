<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-parameters

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-params

```diff
- spec.source.helm.parameters[name=greeting].value: from-param
+ spec.source.helm.parameters[name=greeting].value: param-updated
- spec.source.helm.parameters[name=numeric].value: 0123
+ spec.source.helm.parameters[name=numeric].value: 0456
```

</details>

<details>
<summary><b>web-app-params (argocd)</b> 🟡~1</summary>

#### 📝 ConfigMap/web-app-params-cm

```diff
- data.greeting: from-param
+ data.greeting: param-updated
- data.numeric: 0123
+ data.numeric: 0456
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
