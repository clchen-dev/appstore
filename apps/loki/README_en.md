# Loki

Loki is a log aggregation system from Grafana Labs. It is commonly used with
Grafana to query and visualize application logs.

## Notes

- Default port: `3100`
- Multi-tenancy authentication is disabled by default: `auth_enabled: false`
- Local filesystem storage is used by default
- Default log retention: `168h`

Expose Loki only on a private network or through Tailscale. Do not expose it
directly to the public internet.

For the trading-system use case, run Grafana Alloy on the trading server and
push Docker logs to Loki on the monitoring server:

```text
trading server Alloy -> monitoring server Loki -> Grafana
```

Add Loki as a Grafana data source:

```text
http://loki:3100
```
