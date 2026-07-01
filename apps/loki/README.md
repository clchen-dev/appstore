# Loki

Loki 是 Grafana Labs 的日志聚合系统，适合与 Grafana 一起查询和展示日志。

## 使用说明

- 默认端口：`3100`
- 默认关闭多租户认证：`auth_enabled: false`
- 默认使用本地 filesystem 存储
- 默认日志保留时间：`720h`

建议只在内网或 Tailscale 网络中访问 Loki，不要直接暴露到公网。

交易系统场景中，推荐在交易服务器上运行 Grafana Alloy，将 Docker 日志推送到本机 1Panel 服务器上的 Loki：

```text
trading server Alloy -> monitoring server Loki -> Grafana
```

Grafana 中添加 Loki 数据源：

```text
http://loki:3100
```

如果 Grafana 和 Loki 是 1Panel 中分别安装的应用，并且都在 `1panel-network` 中，也可以使用 Loki 容器名或应用网络别名访问。
