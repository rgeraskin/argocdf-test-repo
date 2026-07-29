<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-unmappable-kind

<details>
<summary><b>cluster-info (argocd)</b> ⚠️ 1 warning(s) 🟢+2</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/cluster-info-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

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

#### ➕ notinstalled.example.com/Gizmo/cluster-info-gizmo

```yaml
apiVersion: notinstalled.example.com/v1
kind: Gizmo
metadata:
    name: cluster-info-gizmo
spec:
    size: big
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +2/-0/~0 resources

---
