<!-- argocdf-diff -->
## ArgoCD Diff: master → case/add-value-file

<details>
<summary><b>grandchild (argocd)</b></summary>

_No changes_

</details>

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-files

```diff
+ spec.source.helm.valueFiles[2]: new-env.yaml
```

</details>

<details>
<summary><b>web-app-files (argocd)</b> 🟡~1</summary>

#### 📝 ConfigMap/web-app-files-cm

```diff
- data.greeting: from-override-file
+ data.greeting: from-new-file
```

</details>

<details>
<summary><b>web-app (argocd)</b></summary>

_No changes_

</details>

<details>
<summary><b>web-app-inline (argocd)</b></summary>

_No changes_

</details>

<details>
<summary><b>web-app-named (argocd)</b></summary>

_No changes_

</details>

<details>
<summary><b>web-app-ns (argocd)</b></summary>

_No changes_

</details>

<details>
<summary><b>web-app-object (argocd)</b></summary>

_No changes_

</details>

<details>
<summary><b>web-app-params (argocd)</b></summary>

_No changes_

</details>

---

**Summary:** 9 applications affected | 2 changed | +0/-0/~2 resources

---
