# Monitoring Containers with Prometheus and cAdvisor

![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-orange?style=for-the-badge&logo=prometheus)
![Docker](https://img.shields.io/badge/Docker-Containers-blue?style=for-the-badge&logo=docker)
![cAdvisor](https://img.shields.io/badge/cAdvisor-Container%20Metrics-green?style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-yellow?style=for-the-badge&logo=linux)
![DevOps](https://img.shields.io/badge/DevOps-Observability-purple?style=for-the-badge)

## Overview

This lab demonstrates how to monitor Docker containers using **Prometheus** and **cAdvisor**.

The objective is to collect infrastructure and container-level metrics from running Docker workloads and visualize them through Prometheus. During the lab, cAdvisor was deployed as a container metrics exporter and configured as a Prometheus scrape target.

This setup provides visibility into:

- Container CPU usage
- Container memory consumption
- Filesystem usage
- Network traffic
- Container lifecycle metrics
- Docker runtime statistics

---

## Objectives

- Deploy cAdvisor for container monitoring.
- Verify Docker containers are running correctly.
- Configure Prometheus to scrape container metrics.
- Validate targets in Prometheus.
- Explore collected metrics.
- Understand how Prometheus integrates with Docker environments.

---

## Architecture

```text
+----------------------+
|     Prometheus       |
|      :9090           |
+----------+-----------+
           |
           |
           v
+----------------------+
|      cAdvisor        |
|      :8080           |
+----------+-----------+
           |
           |
           v
+----------------------+
| Docker Containers    |
+----------------------+
```

---

## Repository Structure

```text
prometheus-monitoring-containers/
│
├── README.md
│
├── manifests/
│   └── prometheus.yml
│
├── outputs/
│   ├── docker-ps.txt
│   ├── docker-images.txt
│   ├── prometheus-targets.json
│   └── prometheus-config.yml
│
└── screenshots/
    ├── DockerContainersRunning.png
    ├── DockerImages.png
    ├── PrometheusTargets.png
    ├── PrometheusConfiguration.png
    ├── CadvisorMetrics.png
    └── DockerMetrics.png
```

---

# Environment Information

| Component | Version |
|------------|------------|
| Ubuntu | 20.04 LTS |
| Prometheus | 3.5.0 |
| Docker | Installed |
| cAdvisor | Latest available image |
| Node Exporter | Previously configured |
| Linux Kernel | Ubuntu Lab Environment |

---

# Step 1 - Verify Docker Environment

Validate Docker installation.

```bash
docker ps
```

Expected output:

```text
CONTAINER ID   IMAGE
...
```

---


#  Step 2 - Verify Available Images

List local Docker images.

```bash
docker images
```

---

#  Step 3 - Deploy cAdvisor

Run cAdvisor container.

```bash
docker run \
-d \
--name=cadvisor \
-p 8080:8080 \
-v /:/rootfs:ro \
-v /var/run:/var/run:ro \
-v /sys:/sys:ro \
-v /var/lib/docker:/var/lib/docker:ro \
gcr.io/cadvisor/cadvisor:latest
```

Verify container status.

```bash
docker ps
```

---

#  Step 4 - Configure Prometheus

Update Prometheus configuration file.

Example:

```yaml
scrape_configs:

  - job_name: "prometheus"

    static_configs:
      - targets:
          - localhost:9090

  - job_name: "cadvisor"

    static_configs:
      - targets:
          - localhost:8080
```


# Step 5 - Restart Prometheus

Reload configuration.

```bash
systemctl restart prometheus
```

Verify service status.

```bash
systemctl status prometheus
```

---

# Step 6 - Verify Targets

Open:

```text
http://<server-ip>:9090/targets
```

Expected targets:

| Target | Status |
|----------|----------|
| Prometheus | UP |
| cAdvisor | UP |

---


# Step 7 - Explore cAdvisor Metrics

Open:

```text
http://<server-ip>:8080/metrics
```

Example metrics:

```text
container_cpu_usage_seconds_total
container_memory_usage_bytes
container_network_receive_bytes_total
container_fs_usage_bytes
```

# Step 8 - Query Metrics in Prometheus

Example query:

```promql
container_cpu_usage_seconds_total
```

Memory usage:

```promql
container_memory_usage_bytes
```

Network received bytes:

```promql
container_network_receive_bytes_total
```

Filesystem usage:

```promql
container_fs_usage_bytes
```


# Metrics Collected

| Category | Example Metric |
|-----------|-----------|
| CPU | container_cpu_usage_seconds_total |
| Memory | container_memory_usage_bytes |
| Network | container_network_receive_bytes_total |
| Network | container_network_transmit_bytes_total |
| Filesystem | container_fs_usage_bytes |
| Container State | container_last_seen |
| Container Tasks | container_tasks_state |

---

# Validation Commands

Verify running containers:

```bash
docker ps
```

Inspect container:

```bash
docker inspect cadvisor
```

Check Prometheus targets:

```bash
curl http://localhost:9090/api/v1/targets
```

Verify metrics endpoint:

```bash
curl http://localhost:8080/metrics
```

---

# Key Concepts Learned

- Container observability
- Docker monitoring
- cAdvisor architecture
- Prometheus scrape targets
- Metrics collection
- Infrastructure monitoring
- Time-series metrics
- Service discovery concepts
- Monitoring best practices

---

# Skills Demonstrated

- Prometheus Administration
- Docker Monitoring
- Container Observability
- Linux Administration
- Metrics Collection
- Infrastructure Monitoring
- DevOps Monitoring Practices
- Troubleshooting Monitoring Systems

---

# Lab Outcome

Successfully deployed and configured **cAdvisor** as a Prometheus target to monitor Docker containers.

Prometheus was able to scrape and store container metrics, providing visibility into CPU, memory, network, and filesystem utilization for running containers. This lab demonstrates a foundational monitoring architecture commonly used in modern Kubernetes and Docker-based production environments.
