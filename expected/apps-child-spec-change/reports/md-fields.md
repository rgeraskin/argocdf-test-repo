<!-- argocdf-diff -->
## ArgoCD Diff: master → case/apps-child-spec-change

<details>
<summary><b>root-app (argocd)</b> 🟡~1</summary>

#### 📝 argocd/argoproj.io/Application/web-app

```diff
- spec.source.path: apps/web-app
+ spec.source.path: apps/widget-operator
```

</details>

<details>
<summary><b>web-app (argocd)</b> 🟢+1 🔴-1 🟡~1</summary>

#### ➕ apiextensions.k8s.io/CustomResourceDefinition/widgets.example.com

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
    name: widgets.example.com
spec:
    group: example.com
    names:
        kind: Widget
        plural: widgets
    scope: Namespaced
    versions:
        - name: v1
          schema:
            openAPIV3Schema:
                type: object
          served: true
          storage: true
```

#### ➖ apps/Deployment/web-app-web

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: web-app-web
spec:
    replicas: 1
    selector:
        matchLabels:
            app: web-app
    template:
        metadata:
            labels:
                app: web-app
        spec:
            containers:
                - image: nginx:1.27.0
                  name: web
```

#### 📝 ConfigMap/web-app-cm

```diff
+ data.color: blue
- data.greeting: from-values
- data.namespace: default
- data.numeric: fallback
+ metadata.labels: map[chart-version:1.0.0]
```

</details>

---

**Summary:** 2 applications affected | 2 changed | +1/-1/~2 resources

---
