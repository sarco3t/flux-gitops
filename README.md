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
