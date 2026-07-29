<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-cr-policy

<details>
<summary><b>root-app (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-kube-system-apps] Application/web-app-ns: Applications must not deploy into the kube-system namespace

#### 📝 argocd/argoproj.io/Application/web-app-ns

```diff
- spec.destination.namespace: base-ns
+ spec.destination.namespace: kube-system
```

</details>

<details>
<summary><b>web-app-ns (argocd)</b> 🟡~1</summary>

#### 📝 ConfigMap/web-app-ns-cm

```diff
- data.namespace: base-ns
+ data.namespace: kube-system
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
