# Push Gateway

## Overview

This lab demonstrates how to install, configure, and integrate **Prometheus Pushgateway** with a Prometheus monitoring environment.

Pushgateway is designed for short-lived jobs and batch processes that cannot be scraped directly by Prometheus. Instead of exposing metrics continuously, applications push their metrics to Pushgateway, which are then scraped by Prometheus.

During this lab, Pushgateway was installed as a system service, integrated with Prometheus, and used to store custom application metrics representing a video processing workload.

---

##  Objectives

* Install Prometheus Pushgateway
* Configure Pushgateway as a systemd service
* Integrate Pushgateway with Prometheus
* Configure a dedicated scrape job
* Push custom metrics into Pushgateway
* Validate metrics ingestion
* Verify target discovery in Prometheus
* Monitor batch job metrics through Prometheus

---

##  Architecture

```text
Batch Job / Application
            │
            ▼
      Push Metrics
            │
            ▼
    Prometheus Pushgateway
            │
            ▼
        Prometheus
            │
            ▼
      Query & Visualization
```

---

## Repository Structure

```text
prometheus-push-gateway/
│
├── README.md
├── manifests/
│   ├── prometheus.yml
│   └── pushgateway.service
│
├── outputs/
│   ├── pushgateway-metrics.txt
│   └── prometheus-targets.json
│
└── screenshot/
```

---

## Prometheus Configuration

A new scrape job was added to monitor Pushgateway.

### `manifests/prometheus.yml`

```yaml
- job_name: pushgateway
  honor_labels: true

  static_configs:
    - targets:
        - localhost:9091
```

### Existing Monitoring Jobs

The environment also monitored:

* Prometheus Server
* Node Exporter (node01)
* Node Exporter (node02)
* Pushgateway

---

## Pushgateway Service

Pushgateway was installed and configured as a systemd service.

### Service Status

```bash
systemctl status pushgateway
```

Output:

```text
Active: active (running)
```

### Binary Location

```bash
/usr/local/bin/pushgateway
```

### Service File

```text
/etc/systemd/system/pushgateway.service
```

---

## Custom Metrics Pushed

The lab simulated a video processing workload that pushed metrics into Pushgateway.

### Processed Videos

```text
processed_videos_total
```

Value:

```text
250
```

Labels:

```text
job="video_processing"
instance="mov_node1"
quality="hd"
```

---

### Processed Bytes

```text
processed_bytes_total
```

Value:

```text
96000
```

Labels:

```text
job="video_processing"
instance="mov_node1"
quality="hd"
```

---

### Processing Time

```text
processing_time_seconds
```

Value:

```text
400
```

Labels:

```text
job="video_processing"
instance="mov_node1"
quality="hd"
```

---

## Verify Metrics in Pushgateway

Metrics were successfully stored and exposed through:

```bash
curl localhost:9091/metrics
```

Example:

```text
processed_bytes_total{instance="mov_node1",job="video_processing",quality="hd"} 96000

processed_videos_total{instance="mov_node1",job="video_processing",quality="hd"} 250

processing_time_seconds{instance="mov_node1",job="video_processing",quality="hd"} 400
```

---

## Verify Prometheus Targets

Targets were validated using:

```bash
curl localhost:9090/api/v1/targets
```

Prometheus successfully discovered:

```text
localhost:9090
node01:9100
node02:9100
localhost:9091
```

Pushgateway target status:

```text
health: up
job: pushgateway
instance: localhost:9091
```

---

## Pushgateway Internal Metrics

Pushgateway automatically exposes operational metrics such as:

### HTTP Requests

```text
pushgateway_http_requests_total
```

### Push Duration

```text
pushgateway_http_push_duration_seconds
```

### Push Size

```text
pushgateway_http_push_size_bytes
```

### Build Information

```text
pushgateway_build_info
```

### Success Timestamps

```text
push_time_seconds
```

### Failure Timestamps

```text
push_failure_time_seconds
```

---

##  Validation Commands

### Check Pushgateway Metrics

```bash
curl localhost:9091/metrics
```

### Check Prometheus Targets

```bash
curl localhost:9090/api/v1/targets
```

### Verify Service Status

```bash
systemctl status pushgateway
```

### Verify Installed Binary

```bash
which pushgateway
```

---

## Key Concepts Learned

* Push-based metric collection
* Pushgateway architecture
* Batch job monitoring
* Prometheus service discovery
* Prometheus scrape jobs
* Metric persistence in Pushgateway
* Label management
* Systemd service configuration
* Monitoring short-lived processes

---

## Technologies Used

* Prometheus
* Pushgateway
* Linux
* Systemd
* Node Exporter
* HTTP Metrics Endpoints
* PromQL
* YAML

---

##  Lab Outcome

Successfully installed and configured **Prometheus Pushgateway**, integrated it with Prometheus, pushed custom application metrics representing a video processing workload, and verified successful scraping and monitoring through Prometheus.

This implementation demonstrates how Pushgateway can be used to monitor short-lived jobs and batch processes that cannot be scraped directly by Prometheus.
