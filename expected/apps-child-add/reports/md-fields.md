<!-- argocdf-diff -->
## ArgoCD Diff: master → case/apps-child-add

<details>
<summary><b>root-app (argocd)</b> 🟢+1</summary>

#### ➕ argocd/argoproj.io/Application/child-added

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: child-added
    namespace: argocd
spec:
    destination:
        namespace: default
        server: https://kubernetes.default.svc
    project: default
    source:
        helm:
            values: |
                greeting: added-child
        path: apps/web-app
        repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
        targetRevision: HEAD
    syncPolicy:
        automated: {}
        syncOptions:
            - CreateNamespace=true
```

</details>

<details>
<summary><b>child-added (argocd)</b> 🟢+2</summary>

#### ➕ ConfigMap/child-added-cm

```yaml
apiVersion: v1
data:
    greeting: added-child
    namespace: default
    numeric: fallback
kind: ConfigMap
metadata:
    name: child-added-cm
```

#### ➕ apps/Deployment/child-added-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: child-added-web
spec:
    replicas: 1
    selector:
        matchLabels:
            app: child-added
    template:
        metadata:
            labels:
                app: child-added
        spec:
            containers:
                - image: nginx:1.27.0
                  name: web
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +3/-0/~0 resources

---
