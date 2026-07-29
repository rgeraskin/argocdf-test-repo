<!-- argocdf-diff -->
## ArgoCD Diff: master → case/grandchild-add

<details>
<summary><b>nested-apps (argocd)</b> 🟢+1</summary>

#### ➕ argocd/argoproj.io/Application/grandchild-added

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: grandchild-added
    namespace: argocd
spec:
    destination:
        namespace: default
        server: https://kubernetes.default.svc
    project: default
    source:
        helm:
            releaseName: grandchild-added-app
            values: |
                greeting: from-added-grandchild
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
<summary><b>grandchild-added (argocd)</b> 🟢+2</summary>

#### ➕ ConfigMap/grandchild-added-app-cm

```yaml
apiVersion: v1
data:
    greeting: from-added-grandchild
    namespace: default
    numeric: fallback
kind: ConfigMap
metadata:
    name: grandchild-added-app-cm
```

#### ➕ apps/Deployment/grandchild-added-app-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: grandchild-added-app-web
spec:
    replicas: 1
    selector:
        matchLabels:
            app: grandchild-added-app
    template:
        metadata:
            labels:
                app: grandchild-added-app
        spec:
            containers:
                - image: nginx:1.27.0
                  name: web
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +3/-0/~0 resources

---
