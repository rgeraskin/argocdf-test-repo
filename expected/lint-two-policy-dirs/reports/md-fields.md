<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-two-policy-dirs

<details>
<summary><b>cluster-info (argocd)</b> ⚠️ 2 warning(s) 🟢+1</summary>

> ⚠️ **2 warning(s):**
> - [target] [lint-kyverno#1/disallow-latest-tag] Deployment/cluster-info-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)
> - [target] [lint-kyverno#2/broken-expression] ERROR Deployment/cluster-info-web: expression &#39;object.spec.nonexistentField == &#39;whatever&#39;&#39; resulted in error: no such key: nonexistentField

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
