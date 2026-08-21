<!-- argocdf-diff -->
## ArgoCD Diff: master → case/plain-oci-artifact

<details>
<summary><b>root-app (argocd)</b> 🟢+1</summary>

#### ➕ argocd/argoproj.io/Application/plain-artifact

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    name: plain-artifact
    namespace: argocd
spec:
    destination:
        namespace: default
        server: https://kubernetes.default.svc
    project: default
    source:
        path: manifests
        repoURL: oci://127.0.0.1.nip.io:5317/artifacts/plain-app
        targetRevision: 1.0.0
    syncPolicy:
        automated: {}
        syncOptions:
            - CreateNamespace=true
```

</details>

<details>
<summary><b>plain-artifact (argocd)</b> 🟢+2</summary>

#### ➕ ConfigMap/plain-artifact-config

```yaml
apiVersion: v1
data:
    layer: application/vnd.oci.image.layer.v1.tar+gzip
    origin: oci-artifact-not-a-chart
kind: ConfigMap
metadata:
    name: plain-artifact-config
```

#### ➕ Service/plain-artifact-svc

```yaml
apiVersion: v1
kind: Service
metadata:
    name: plain-artifact-svc
spec:
    ports:
        - port: 80
          targetPort: 8080
    selector:
        app: plain-artifact
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +3/-0/~0 resources

---
