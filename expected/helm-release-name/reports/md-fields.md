<!-- argocdf-diff -->
## ArgoCD Diff: master → case/helm-release-name

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app-named

```diff
- spec.source.helm.releaseName: base-release
+ spec.source.helm.releaseName: renamed-release
```

</details>

<details>
<summary><b>web-app-named (argocd)</b> 🟢+2 🔴-2</summary>

#### ➕ ConfigMap/renamed-release-cm

```yaml
apiVersion: v1
data:
    greeting: from-values
    namespace: default
    numeric: fallback
kind: ConfigMap
metadata:
    name: renamed-release-cm
```

#### ➕ apps/Deployment/renamed-release-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: renamed-release-web
spec:
    replicas: 1
    selector:
        matchLabels:
            app: renamed-release
    template:
        metadata:
            labels:
                app: renamed-release
        spec:
            containers:
                - image: nginx:1.27.0
                  name: web
```

#### ➖ ConfigMap/base-release-cm

```yaml
apiVersion: v1
data:
    greeting: from-values
    namespace: default
    numeric: fallback
kind: ConfigMap
metadata:
    name: base-release-cm
```

#### ➖ apps/Deployment/base-release-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: base-release-web
spec:
    replicas: 1
    selector:
        matchLabels:
            app: base-release
    template:
        metadata:
            labels:
                app: base-release
        spec:
            containers:
                - image: nginx:1.27.0
                  name: web
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +2/-2/~1 resources

---
