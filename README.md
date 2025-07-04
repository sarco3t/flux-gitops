# flux-gitops

This repository contains Flux manifests for the demo Kubernetes cluster.

The cluster deploys the `kbot` application (see `clusters/demo/kbot-hr.yml`) alongside a monitoring stack consisting of:

- OpenTelemetry Operator
- OpenTelemetry Collector
- Fluent Bit (forwarding logs to the collector)
- Prometheus
- Grafana Loki
- Grafana

Helm repositories and releases for these tools are defined under `clusters/demo/otel/`.
Additional Helm releases for Loki, Prometheus and Grafana live in the same directory.
The `clusters/demo` directory now includes a `kustomization.yaml` that pulls in
all manifests from this `otel` folder so they are part of the cluster build.

## Testing the manifests

If you have `kustomize` installed, you can render all manifests for the demo cluster with:

```bash
kustomize build clusters/demo
```

To apply the changes to a cluster managed by Flux, run:

```bash
flux reconcile kustomization kbot --with-source
```

This triggers Flux to pull the latest manifests and deploy them.
