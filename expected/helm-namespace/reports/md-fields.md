<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-namespace

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-ns

```diff
- spec.destination.namespace: base-ns
+ spec.destination.namespace: prod-ns
```

</details>

<details>
<summary><b>web-app-ns (argocd)</b> 🟡~1</summary>

#### 📝 ConfigMap/web-app-ns-cm

```diff
- data.namespace: base-ns
+ data.namespace: prod-ns
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
