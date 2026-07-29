<!-- argocdf-diff -->
## ArgoCD Diff: master → case/kustomize-helm

<details>
<summary>Show diff for <b>kustomize-helm (argocd)</b> — 🟡~1</summary>

#### 📝 apps/Deployment/kusthelm-podinfo

```diff
--- base/apps/Deployment/kusthelm-podinfo
+++ target/apps/Deployment/kusthelm-podinfo
@@ -8,7 +8,7 @@
         helm.sh/chart: podinfo-6.7.0
     name: kusthelm-podinfo
 spec:
-    replicas: 1
+    replicas: 2
     selector:
         matchLabels:
             app.kubernetes.io/name: kusthelm-podinfo
```

</details>

---

**Summary:** 1 applications affected | 1 changed | +0/-0/~1 resources

---
