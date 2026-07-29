<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-conftest

<details>
<summary><b>cluster-info (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [conftest/no_plaintext_credentials] ConfigMap/cluster-info-cm: data key &#34;note&#34; must not carry a plaintext credential

#### 📝 ConfigMap/cluster-info-cm

```diff
- data.note: base
+ data.note: db connection password=placeholder
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
