<!-- argocdf-diff -->
## ArgoCD Diff: master → case/lint-introduced

<details>
<summary><b>grandchild (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/grandchild-app-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/grandchild-app-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

<details>
<summary><b>web-app (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

<details>
<summary><b>web-app-files (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-files-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-files-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

<details>
<summary><b>web-app-inline (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-inline-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-inline-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

<details>
<summary><b>web-app-named (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/base-release-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/base-release-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

<details>
<summary><b>web-app-ns (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-ns-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-ns-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

<details>
<summary><b>web-app-object (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-object-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-object-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

<details>
<summary><b>web-app-params (argocd)</b> ⚠️ 1 warning(s) 🟡~1</summary>

> ⚠️ **1 warning(s):**
> - [target] [kyverno/disallow-latest-tag] Deployment/web-app-params-web: container images must be pinned to a tag (&#39;:latest&#39; or tag-less images are not allowed)

#### 📝 apps/Deployment/web-app-params-web

```diff
- spec.template.spec.containers[name=web].image: nginx:1.27.0
+ spec.template.spec.containers[name=web].image: nginx:latest
```

</details>

---

**Summary:** 8 applications affected | 8 changed | +0/-0/~8 resources

---
