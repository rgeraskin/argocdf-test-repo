<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-schema-fail

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/schema-app

```diff
- spec.source.helm: map[skipSchemaValidation:true]
```

</details>

<details>
<summary><b>schema-app (argocd)</b> ❌ Error</summary>

> ⚠️ failed to render target branch: failed to render source 0: failed to execute helm template command: failed to get command args to log: `helm template . --name-template schema-app --namespace default --kube-version 1.34.8 &lt;api versions removed&gt; --include-crds` failed exit status 1: Error: values don&#39;t meet the specifications of the schema(s) in the following chart(s):
> schema-app:
> - at &#39;/replicas&#39;: got string, want integer

</details>

---

**Summary:** 2 applications affected | 1 changed | +0/-0/~1 resources | 1 errors

---
