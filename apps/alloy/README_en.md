# Grafana Alloy

Grafana Alloy is a programmable telemetry collector for logs, metrics, traces, and profiles.

This template is designed for one Alloy instance per Docker host:

- Automatically discover Docker containers and send stdout/stderr logs to Loki.
- Collect Docker container CPU, memory, network, and filesystem metrics through cAdvisor and send them with Prometheus remote write.
- Scrape application `/metrics` endpoints only when containers opt in with Docker labels.

## Required backend URLs

- Loki push URL, for example `http://loki:3100/loki/api/v1/push`
- Metrics remote write URL, for example `http://victoriametrics:8428/api/v1/write`

For centralized multi-server monitoring, point every server's Alloy instance at the same central Loki and VictoriaMetrics or Mimir endpoints. Use a unique host label for every server.

## Recommended server labels

- `HOST_LABEL`: stable server name, for example `vps-edmonton-01`
- `ENV_LABEL`: environment, for example `prod`
- `REGION_LABEL`: region, for example `ca`
- `PROVIDER_LABEL`: provider, for example `oracle`
- `ROLE_LABEL`: role, for example `app`

## Application metrics labels

Container logs and container resource metrics are automatic. Business metrics are opt-in. Add labels to any application container that exposes Prometheus metrics:

```yaml
labels:
  prometheus.scrape: "true"
  prometheus.port: "8080"
  prometheus.path: "/metrics"
  prometheus.job: "my-app"
```

Optional:

```yaml
labels:
  prometheus.scheme: "http"
```

## Notes

The container runs privileged and mounts Docker and host system paths because cAdvisor needs host access to collect container metrics.
