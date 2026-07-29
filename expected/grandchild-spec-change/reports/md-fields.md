<!-- argocdf-diff -->
## ArgoCD Diff: master → case/grandchild-spec-change

<details>
<summary><b>nested-apps (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/grandchild

```diff
- spec.source.helm.values: greeting: from-grandchild

+ spec.source.helm.values: greeting: grandchild-updated

```

</details>

<details>
<summary><b>grandchild (argocd)</b> 🟡~1</summary>

#### 📝 ConfigMap/grandchild-app-cm

```diff
- data.greeting: from-grandchild
+ data.greeting: grandchild-updated
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-0/~2 resources

---
