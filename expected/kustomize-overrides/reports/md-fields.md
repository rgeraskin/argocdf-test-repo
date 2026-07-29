<!-- argocdf-diff -->
## ArgoCD Diff: master → case/kustomize-overrides

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/kustomize-app-overrides

```diff
+ spec.source.kustomize.commonLabels: map[team:platform]
+ spec.source.kustomize.images: [nginx=nginx:1.27.1]
- spec.source.kustomize.namePrefix: base-
+ spec.source.kustomize.namePrefix: pre-
+ spec.source.kustomize.namespace: production
```

</details>

<details>
<summary><b>kustomize-app-overrides (argocd)</b> ⚠️ 1 warning(s) 🟢+2 🔴-2</summary>

> ⚠️ **1 warning(s):**
> - [base] [kyverno/disallow-latest-tag] Deployment/base-kust-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### ➕ production/ConfigMap/pre-kust-cm

```yaml
apiVersion: v1
data:
    tier: basic
kind: ConfigMap
metadata:
    labels:
        team: platform
    name: pre-kust-cm
    namespace: production
```

#### ➕ production/apps/Deployment/pre-kust-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    labels:
        team: platform
    name: pre-kust-web
    namespace: production
spec:
    selector:
        matchLabels:
            app: kust
            team: platform
    template:
        metadata:
            labels:
                app: kust
                team: platform
        spec:
            containers:
                - image: nginx:1.27.1
                  name: web
```

#### ➖ ConfigMap/base-kust-cm

```yaml
apiVersion: v1
data:
    tier: basic
kind: ConfigMap
metadata:
    name: base-kust-cm
```

#### ➖ apps/Deployment/base-kust-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: base-kust-web
spec:
    selector:
        matchLabels:
            app: kust
    template:
        metadata:
            labels:
                app: kust
        spec:
            containers:
                - image: nginx:latest
                  name: web
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +2/-2/~1 resources

---
