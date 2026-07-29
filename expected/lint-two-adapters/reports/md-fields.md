<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-two-adapters

<details>
<summary><b>cluster-info (argocd)</b> ⚠️ 2 warning(s) 🟢+1 🟡~1</summary>

> ⚠️ **2 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/cluster-info-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)
> - [target] [conftest/no_plaintext_credentials] ConfigMap/cluster-info-cm: data key &#34;note&#34; must not carry a plaintext credential

#### ➕ apps/Deployment/cluster-info-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: cluster-info-web
spec:
    replicas: 1
    selector:
        matchLabels:
            app: cluster-info
    template:
        metadata:
            labels:
                app: cluster-info
        spec:
            containers:
                - image: nginx:latest
                  name: web
```

#### 📝 ConfigMap/cluster-info-cm

```diff
- data.note: base
+ data.note: db connection password=placeholder
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +1/-0/~1 resources

---
