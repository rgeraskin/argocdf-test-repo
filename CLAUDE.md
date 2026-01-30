# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository implements an ArgoCD "apps-of-apps" pattern for managing Kubernetes applications across multiple environments (dev, prod). The architecture uses ArgoCD's declarative GitOps approach where all applications and the ArgoCD installation itself are defined as code.

## Architecture

### Three-Layer Application Structure

1. **Bootstrap Layer** (`argocd/`)
   - Contains the ArgoCD installation manifest via Kustomize
   - References ArgoCD v2.9.6 from upstream manifests
   - Defines three root Application resources that form the apps-of-apps pattern

2. **Apps-of-Apps Layer** (`charts/apps/`)
   - Helm chart that dynamically generates ArgoCD Application resources
   - Template iterates over `applications` list in values files
   - Each environment (dev/prod) has its own values file defining which apps to deploy
   - Generated apps point to individual app directories in `apps/{env}/{app-name}`

3. **Individual Apps Layer** (`apps/`)
   - Environment-specific app configurations organized as: `apps/{env}/{app-name}/`
   - Each app directory contains:
     - `Chart.yaml` - App-specific chart metadata
     - `values.yaml` - Environment-specific overrides for the app
     - `charts/` subdirectory with symlink to generic `charts/app/` chart

### The Generic App Chart (`charts/app/`)

- Reusable Helm chart for deploying any application
- Provides standard Kubernetes resources: Deployment, Service, ConfigMap
- Apps reference this via symlink to maintain consistency while allowing customization through values
- Key configurable parameters: image, replicas, resources, environment variables, service settings

### Root Applications

The three root apps defined in `argocd/root-apps/`:
- **argocd.yaml** - Self-manages the ArgoCD installation
- **dev-apps.yaml** - Uses `charts/apps` with `values-dev.yaml` to deploy dev apps
- **prod-apps.yaml** - Uses `charts/apps` with `values-prod.yaml` to deploy prod apps

All use `automated` sync policy with `prune: true` and `selfHeal: true`.

## Working with This Repository

### Bootstrapping ArgoCD

To install ArgoCD with all applications:
```bash
kubectl apply -k argocd/
```

This installs ArgoCD, creates the argocd namespace, and bootstraps all three root applications.

### Managing Applications

**Add a new application to an environment:**

1. Create app directory structure:
   ```bash
   mkdir -p apps/{env}/{app-name}/charts
   ```

2. Create `apps/{env}/{app-name}/Chart.yaml`:
   ```yaml
   apiVersion: v2
   name: {app-name}
   type: application
   version: 0.1.0
   appVersion: "1.0.0"
   ```

3. Create `apps/{env}/{app-name}/values.yaml` with overrides for the generic chart:
   ```yaml
   app:
     replicaCount: 2
     image:
       repository: myapp
       tag: "1.0.0"
   ```

4. Create symlink to generic chart:
   ```bash
   cd apps/{env}/{app-name}/charts
   ln -s ../../../../charts/app/ app
   ```

5. Add app to `charts/apps/values-{env}.yaml`:
   ```yaml
   applications:
     - name: {app-name}
   ```

**Remove an application:**

1. Remove entry from `charts/apps/values-{env}.yaml`
2. Delete app directory (optional, since prune is enabled)

### Using MCP Kubernetes Tools

When working with this repository, use MCP kubectl tools for all Kubernetes operations:
- Use `mcp__kubernetes__kubectl_get` to view ArgoCD applications and resources
- Use `mcp__kubernetes__kubectl_describe` to inspect application status
- Use `mcp__kubernetes__kubectl_logs` to check ArgoCD controller logs

Example: Check all ArgoCD applications:
```
Use mcp__kubernetes__kubectl_get with resourceType="applications" and namespace="argocd"
```

### Key Configuration Points

**Repository URL:** All ArgoCD applications reference `https://github.com/rgeraskin/argocdf-test-repo.git` (defined in `charts/apps/values.yaml` and `argocd/root-apps/*.yaml`)

**Target Revision:** All apps track `HEAD` by default (main branch)

**Namespace Strategy:** Each app deploys to `{env}-{app-name}` namespace with auto-creation enabled

**Sync Policy:** All applications use automated sync with prune and self-heal enabled, meaning:
- Changes pushed to git are automatically deployed
- Resources removed from git are deleted from cluster
- Manual changes in cluster are reverted to match git

### Understanding the Flow

When you commit changes:
1. ArgoCD polls the repository (or receives webhook)
2. Root apps (dev-apps/prod-apps) detect changes in `charts/apps/`
3. Helm template renders updated Application resources
4. ArgoCD creates/updates child Application resources
5. Child apps sync their specific configurations from `apps/{env}/{app-name}/`

This pattern allows managing dozens or hundreds of apps without manually creating ArgoCD Application manifests for each one.
