<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-policy-added

<details>
<summary><b>cluster-info (argocd)</b> ⚠️ 2 warning(s) 🟢+1</summary>

> ⚠️ **2 warning(s):**
> - [base] lint-kyverno#1 policies/kyverno-added: no policies on this side — not linted
> - [target] [kyverno/require-pinned-images] Deployment/cluster-info-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

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

</details>

---

**Summary:** 1 applications affected | 1 changed | +1/-0/~0 resources

---
