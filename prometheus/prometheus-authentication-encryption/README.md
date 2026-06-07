# Prometheus Authentication & Encryption Lab

## Overview

This lab demonstrates how to secure communication between **Prometheus** and **Node Exporter** using **TLS/HTTPS encryption**.

By default, Prometheus scrapes metrics over HTTP. In this lab, Node Exporter was configured to expose metrics securely through HTTPS using self-signed certificates, and Prometheus was configured to trust and scrape those encrypted endpoints.

This implementation follows security best practices for production monitoring environments where metrics traffic should not travel in plain text across the network.

---

## Objectives

* Install and configure Prometheus
* Secure Node Exporter with TLS
* Generate and deploy SSL certificates
* Configure Prometheus to scrape HTTPS endpoints
* Validate encrypted metrics collection
* Verify target health status
* Test secure communication using curl
* Validate Prometheus configuration using Promtool

---

## Architecture

```text
                   ┌──────────────────┐
                   │    Prometheus    │
                   │  Port: 9090      │
                   └─────────┬────────┘
                             │
                    HTTPS/TLS │
                             │
          ┌──────────────────┴──────────────────┐
          │                                     │
          ▼                                     ▼

 ┌─────────────────┐                 ┌─────────────────┐
 │  Node Exporter  │                 │  Node Exporter  │
 │     node01      │                 │     node02      │
 │   Port: 9100    │                 │   Port: 9100    │
 └─────────────────┘                 └─────────────────┘
```

---

## Technologies Used

* Prometheus 3.5.0
* Node Exporter
* TLS / SSL
* OpenSSL
* HTTPS
* Linux
* Systemd
* Promtool

---

## Repository Structure

```text
prometheus-authentication-encryption/
│
├── README.md
│
├── manifests/
│   ├── prometheus.yml
│   ├── config.yml
│   ├── prometheus.service
│   └── node_exporter.service
│
├── outputs/
│   ├── prometheus-targets.json
│   ├── promtool-validation.txt
│   ├── tls-certificate-info.txt
│   ├── prometheus-config.txt
│   └── node01-node-exporter-status.txt
│
└── screenshot/
```

---

## Node Exporter TLS Configuration

Node Exporter was configured to use TLS by defining a web configuration file.

### config.yml

```yaml
tls_server_config:
  cert_file: node_exporter.crt
  key_file: node_exporter.key
```

---

## Node Exporter Service

```ini
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter --web.config.file=/etc/node_exporter/config.yml

[Install]
WantedBy=multi-user.target
```

---

## Prometheus HTTPS Scraping Configuration

Prometheus was configured to scrape metrics through HTTPS.

```yaml
- job_name: "nodes"

  scheme: https

  tls_config:
    ca_file: /etc/prometheus/node_exporter.crt
    insecure_skip_verify: true

  static_configs:
    - targets:
      - node01:9100
      - node02:9100
```

---

## Certificate Information

A self-signed TLS certificate was generated and used to secure Node Exporter.

### Certificate Location

```text
/etc/prometheus/node_exporter.crt
```

### Private Key Location

```text
/etc/prometheus/node_exporter.key
```

### Certificate Properties

| Property    | Value       |
| ----------- | ----------- |
| Algorithm   | RSA         |
| Key Size    | 2048 bits   |
| Type        | Self-Signed |
| Validity    | 1 Year      |
| Common Name | localhost   |

---

##  Service Verification

### Prometheus

```bash
systemctl status prometheus
```

Result:

```text
active (running)
```

### Node Exporter

```bash
systemctl status node_exporter
```

Result:

```text
active (running)
```

---

## Validate Prometheus Configuration

```bash
promtool check config /etc/prometheus/prometheus.yml
```

Output:

```text
SUCCESS
```

---

## Verify HTTPS Endpoint

### Node01

```bash
curl -k https://node01:9100/metrics
```

### Node02

```bash
curl -k https://node02:9100/metrics
```

Expected output:

```text
# HELP go_gc_duration_seconds
# TYPE go_gc_duration_seconds summary
```

This confirms that metrics are being served securely over HTTPS.

---

## Verify Targets

Prometheus Targets API:

```bash
curl http://localhost:9090/api/v1/targets
```

Result:

```json
"health":"up"
```

For:

```text
node01:9100
node02:9100
```

Prometheus successfully scraped both encrypted endpoints.

---

## Troubleshooting

### HTTP Request Sent to HTTPS Server

When attempting to access the endpoint using HTTP:

```text
client sent an HTTP request to an HTTPS server
```

This behavior is expected because Node Exporter was configured to accept HTTPS traffic only.

---

## Security Improvements Achieved

* Encrypted metrics transmission
* TLS enabled on Node Exporter
* HTTPS scraping from Prometheus
* Dedicated service accounts
* Reduced exposure of monitoring traffic
* Production-oriented monitoring configuration

---

## Skills Demonstrated

* Prometheus Administration
* Monitoring & Observability
* Linux System Administration
* TLS Configuration
* HTTPS Endpoints
* Certificate Management
* Infrastructure Security
* Node Exporter Configuration
* Prometheus Target Management
* Troubleshooting Monitoring Systems

---

##  Learning Outcome

By completing this lab, I gained hands-on experience securing Prometheus monitoring infrastructure using TLS encryption. The implementation demonstrates how to protect metrics traffic, configure secure exporters, and validate encrypted communication between monitoring components in a production-like environment.

---
