# flux-gitops

This repository contains Flux manifests and Terraform modules for a demo Kubernetes cluster.

**[▶️ Watch demonstration video](media/video.mp4)**

## Features
- GitOps deployment with Flux
- `kbot` application (see `clusters/demo/kbot-hr.yml`)
- Monitoring stack: OpenTelemetry, Fluent Bit, Prometheus, Grafana Loki, Grafana

## Directory Structure
- `bootstrap/` – Terraform modules for cluster & Flux bootstrap
- `clusters/` – Flux manifests and kustomizations
- `media/` – Demo video

## Prerequisites
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)
- [flux](https://fluxcd.io/docs/installation/)
- [terraform](https://www.terraform.io/downloads.html)
- [sops](https://github.com/mozilla/sops) & `age.key` for secrets

## Quick Start
1. **Bootstrap cluster & Flux:**
   ```bash
   cd bootstrap
   terraform init && terraform apply
   ```
2. **Render manifests:**
   ```bash
   kustomize build ../clusters/demo
   ```
3. **Trigger Flux deployment:**
   ```bash
   flux reconcile kustomization kbot --with-source
   ```

## Secrets
Secrets (e.g., TELE_TOKEN, API_VERSION) are encrypted with SOPS (`clusters/demo/secret.yml`). You need `age.key` to decrypt or update them.
