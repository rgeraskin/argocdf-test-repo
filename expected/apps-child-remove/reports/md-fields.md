<!-- argocdf-diff -->
## ArgoCD Diff: master → case/apps-child-remove

<details>
<summary><b>root-app (argocd)</b> 🔴-1</summary>

#### ➖ argocd/argoproj.io/Application/plain-manifests

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: plain-manifests
    namespace: argocd
spec:
    destination:
        namespace: default
        server: https://kubernetes.default.svc
    project: default
    source:
        path: apps/plain-manifests
        repoURL: https://github.com/rgeraskin/argocdf-test-repo.git
        targetRevision: HEAD
    syncPolicy:
        automated: {}
        syncOptions:
            - CreateNamespace=true
```

</details>

<details>
<summary><b>plain-manifests (argocd)</b> 🔴-2</summary>

#### ➖ ConfigMap/plain-a

```yaml
apiVersion: v1
data:
    k: a
kind: ConfigMap
metadata:
    name: plain-a
```

#### ➖ ConfigMap/plain-b

```yaml
apiVersion: v1
data:
    k: b
kind: ConfigMap
metadata:
    name: plain-b
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +0/-3/~0 resources

---
