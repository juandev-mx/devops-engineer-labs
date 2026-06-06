# Prometheus Installation

## Overview

This lab demonstrates the installation and configuration of a standalone Prometheus monitoring server on Linux. The environment includes Prometheus running as a systemd service, custom scrape configurations, and monitoring targets using Node Exporter.

The objective is to understand the core Prometheus architecture, service configuration, target discovery, metrics collection, and validation of monitored endpoints.

---

## Technologies Used

* Prometheus 3.5.0
* PromQL
* Node Exporter
* Linux
* Systemd
* HTTP API
* YAML Configuration
* Monitoring & Observability

---

## Architecture

```text
+---------------------+
|  Prometheus Server  |
|      Port 9090      |
+----------+----------+
           |
           |
    +------+------+
    |             |
    |             |
+---v---+     +---v---+
|Node01 |     |Node02 |
|:9100  |     |:9100  |
+-------+     +-------+

Node Exporter Metrics
```

---

## Prometheus Version

```bash
prometheus --version
```

Output:

```text
prometheus, version 3.5.0
go version: go1.24.5
platform: linux/amd64
```

---

## Installed Components

### Prometheus

```bash
which prometheus
```

Output:

```text
/usr/local/bin/prometheus
```

### Promtool

```bash
which promtool
```

Output:

```text
/usr/local/bin/promtool
```

### Node Exporter

```bash
which node_exporter
```

Output:

```text
/usr/local/bin/node_exporter
```

---

## Prometheus Service Configuration

Systemd service:

```ini
[Unit]
Description=Prometheus Server
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple

ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus \
  --web.listen-address=0.0.0.0:9090

[Install]
WantedBy=multi-user.target
```

Verify service status:

```bash
systemctl status prometheus
```

Expected result:

```text
Active: active (running)
```

---

## Node Exporter Service Configuration

```ini
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple

ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```

Verify service:

```bash
systemctl status node_exporter
```

---

## Prometheus Configuration

File:

```bash
/etc/prometheus/prometheus.yml
```

Configuration:

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:

  - job_name: "prometheus"
    static_configs:
      - targets:
          - localhost:9090
        labels:
          app: prometheus

  - job_name: "nodes"
    static_configs:
      - targets:
          - node01:9100
        labels:
          node: node01

      - targets:
          - node02:9100
        labels:
          node: node02
```

---

## Verify Active Targets

Query Prometheus API:

```bash
curl http://localhost:9090/api/v1/targets
```

Observed targets:

| Job        | Target         | Status |
| ---------- | -------------- | ------ |
| prometheus | localhost:9090 | UP     |
| nodes      | node01:9100    | UP     |
| nodes      | node02:9100    | UP     |

---

## Validate Monitoring Endpoints

Prometheus metrics endpoint:

```bash
curl http://localhost:9090/metrics
```

Prometheus targets API:

```bash
curl http://localhost:9090/api/v1/targets
```

---

## Prometheus Data Storage

Prometheus stores time-series data in:

```text
/var/lib/prometheus
```

The downloaded distribution also contains:

```text
prometheus-3.5.0.linux-amd64/
```

Including:

```text
prometheus
promtool
prometheus.yml
data/
```

---

## Skills Demonstrated

* Installing Prometheus on Linux
* Running Prometheus as a systemd service
* Configuring scrape targets
* Monitoring remote nodes
* Understanding Prometheus architecture
* Using Prometheus HTTP API
* Managing Prometheus configuration files
* Verifying target health
* Basic observability practices

---

## Key Commands

### Check Version

```bash
prometheus --version
```

### Verify Service

```bash
systemctl status prometheus
```

### View Configuration

```bash
cat /etc/prometheus/prometheus.yml
```

### Check Targets

```bash
curl http://localhost:9090/api/v1/targets
```

### Validate Metrics Endpoint

```bash
curl http://localhost:9090/metrics
```

### Verify Processes

```bash
ps aux | grep prometheus
```

---

## Learning Outcomes

By completing this lab, I learned how to:

* Install Prometheus from binaries.
* Configure Prometheus as a Linux service.
* Define monitoring targets using static configurations.
* Validate metric collection through the Prometheus API.
* Understand Prometheus architecture and monitoring workflows.
* Monitor infrastructure components using Node Exporter.
* Troubleshoot monitoring services and target connectivity.

---

## Repository Structure

```text
prometheus/
└── prometheus-installation/
    ├── README.md
    ├── outputs/
    │   ├── prometheus-version.txt
    │   ├── prometheus-service.txt
    │   ├── node-exporter-service.txt
    │   ├── prometheus-targets.json
    │   └── prometheus-config.yaml
    └── screenshots/
```

---

GitHub: https://github.com/juandev-mx
