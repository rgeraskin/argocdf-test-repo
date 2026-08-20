<!-- argocdf-diff -->
## ArgoCD Diff: master → case/private-oci-artifact

<details>
<summary><b>root-app (argocd)</b> 🟢+1</summary>

#### ➕ argocd/argoproj.io/Application/private-artifact

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: private-artifact
    namespace: argocd
spec:
    destination:
        namespace: default
        server: https://kubernetes.default.svc
    project: default
    source:
        path: .
        repoURL: oci://127.0.0.1.nip.io:5317/charts/private-app
        targetRevision: 0.1.0
    syncPolicy:
        automated: {}
        syncOptions:
            - CreateNamespace=true
```

</details>

<details>
<summary><b>private-artifact (argocd)</b> 🟢+1</summary>

#### ➕ ConfigMap/private-app

```yaml
apiVersion: v1
data:
    chartVersion: 0.1.0
    message: hello-from-behind-auth
kind: ConfigMap
metadata:
    name: private-app
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +2/-0/~0 resources

---
