# Prometheus Recording Rules

## Overview

This lab focuses on creating and managing **Prometheus Recording Rules**.

Recording Rules allow Prometheus to precompute and store the results of frequently used PromQL expressions as new time series. This improves query performance, simplifies dashboards, and reduces computational overhead when working with complex metrics.

During this lab, Prometheus was configured to monitor:

* Prometheus Server
* Linux Nodes running Node Exporter
* API Services

Custom recording rules were created to calculate:

* Network traffic rates
* Average network traffic per node
* Filesystem free space percentages
* API request latency

---

## Technologies Used

![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge\&logo=prometheus\&logoColor=white)
![PromQL](https://img.shields.io/badge/PromQL-Query%20Language-orange?style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge\&logo=linux\&logoColor=black)
![Node Exporter](https://img.shields.io/badge/Node%20Exporter-339933?style=for-the-badge)
![Monitoring](https://img.shields.io/badge/Monitoring-005571?style=for-the-badge)
![Observability](https://img.shields.io/badge/Observability-4B0082?style=for-the-badge)

---

# Learning Objectives

* Understand Prometheus Recording Rules.
* Create custom recording rules.
* Configure Prometheus rule files.
* Validate rule evaluation.
* Use the Prometheus Rules API.
* Improve query efficiency.
* Monitor infrastructure and application metrics.
* Work with precomputed metrics.

---

# Environment Information

## Prometheus Version

```bash
prometheus --version
```

Output:

```text
prometheus, version 3.5.0
```

---

## Monitored Targets

```text
localhost:9090   (Prometheus)
node01:9100      (Node Exporter)
node02:9100      (Node Exporter)
node01:3000      (API Service)
node02:3000      (API Service)
```

All monitored targets reported:

```text
health = up
```

during the lab execution.

---

# Prometheus Configuration

The Prometheus configuration included custom rule files:

```yaml
rule_files:
  - "*rules.yaml"
  - "api-rules.yaml"
  - "node-rules.yaml"
```

These files were automatically loaded and evaluated every 15 seconds according to:

```yaml
evaluation_interval: 15s
```

---

# Recording Rules Created

## Node Rules

File:

```text
/etc/prometheus/node-rules.yaml
```

### Network Receive Rate

```promql
rate(node_network_receive_bytes_total{job="nodes"}[2m])
```

Recorded As:

```text
node_network_receive_bytes_rate
```

Purpose:

Calculate incoming network traffic rate over a 2-minute interval.

---

### Average Network Receive Rate

```promql
avg by(instance) (
  node_network_receive_bytes_rate
)
```

Recorded As:

```text
node_network_receive_bytes_rate_avg
```

Purpose:

Calculate average incoming traffic per monitored node.

---

### Filesystem Free Percentage

```promql
100 * node_filesystem_free_bytes{job="nodes"} /
node_filesystem_size_bytes{job="nodes"}
```

Recorded As:

```text
node_filesystem_free_percent
```

Purpose:

Calculate filesystem free space percentage.

---

## API Rules

File:

```text
/etc/prometheus/api-rules.yaml
```

### Average API Latency

```promql
rate(http_request_total_sum{job="api"}[2m])
/
rate(http_request_total_count{job="api"}[2m])
```

Recorded As:

```text
avg_latency_2m
```

Purpose:

Calculate average API request latency during the previous two minutes.

---

# Rules API Validation

Prometheus Rules API:

```bash
curl http://localhost:9090/api/v1/rules
```

Returned:

```text
Group: api
Group: node
```

All recording rules reported:

```text
health = ok
```

which confirms successful rule evaluation.

---

# Active Targets Validation

Prometheus successfully scraped metrics from all configured jobs:

```text
prometheus
nodes
api
```

Observed Targets:

```text
localhost:9090
node01:9100
node02:9100
node01:3000
node02:3000
```

Status:

```text
UP
```

for every target.

---

# Prometheus Service Validation

Prometheus service status:

```bash
systemctl status prometheus
```

Result:

```text
Active: active (running)
```

The Rule Manager started successfully:

```text
Starting rule manager...
```

indicating that recording rules were loaded and evaluated correctly.

---

# Evidence Collected

## recording-rules.txt

Contains:

* Prometheus version
* Prometheus configuration
* Active targets
* Rules API output
* Configuration API output
* Service status
* Recording rule validation

---

## node-rules.yaml

Contains node-related recording rules:

* node_network_receive_bytes_rate
* node_network_receive_bytes_rate_avg
* node_filesystem_free_percent

---

## api-rules.yaml

Contains API-related recording rules:

* avg_latency_2m

---

## prometheus.yml

Main Prometheus configuration including rule file loading.

---

# Repository Structure

```text
prometheus/
└── prometheus-recording-rules/
    ├── README.md
    ├── manifests/
    │   ├── prometheus.yml
    │   ├── node-rules.yaml
    │   └── api-rules.yaml
    ├── outputs/
    │   ├── recording-rules.txt
    │   ├── active-targets.json
    │   ├── rules-api.json
    │   └── config-api.json
    └── screenshots/
        ├── RulesPage.png
        ├── TargetsPage.png
        ├── RecordingRulesValidation.png
        └── PrometheusStatus.png
```

---

# Skills Demonstrated

* Prometheus Administration
* PromQL Development
* Recording Rules
* Infrastructure Monitoring
* API Monitoring
* Metrics Aggregation
* Observability Engineering
* Linux Administration
* Prometheus API Usage
* Performance Optimization

---

# Key Takeaways

This lab provided practical experience creating and managing Prometheus Recording Rules. By precomputing frequently used PromQL expressions, Prometheus can serve queries faster and reduce computational overhead. Recording Rules are essential for scalable monitoring environments, efficient dashboard creation, alerting workflows, and advanced observability practices, making them a fundamental skill for DevOps Engineers, Site Reliability Engineers (SREs), and candidates preparing for the Prometheus Certified Associate (PCA) certification.
