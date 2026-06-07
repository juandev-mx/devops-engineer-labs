# PromQL Operators, Vector Matching, and Aggregators

## Overview

This lab focuses on advanced **PromQL (Prometheus Query Language)** features used to manipulate, compare, aggregate, and correlate metrics collected by Prometheus.

The primary objective was to learn how PromQL operators, vector matching techniques, and aggregation functions can be used to perform infrastructure analysis across multiple monitored systems.

During the lab, Prometheus was configured to monitor multiple targets:

* Prometheus Server
* Web Servers (`node01`, `node02`)
* Load Balancer
* API Service

The collected metrics were queried through the Prometheus Expression Browser using comparison operators, logical operators, aggregation functions, and vector matching techniques.

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

* Understand PromQL binary operators.
* Work with comparison operators.
* Use logical operators.
* Perform metric aggregation.
* Analyze grouped metrics.
* Understand vector matching concepts.
* Correlate metrics from multiple targets.
* Extract operational insights from monitored infrastructure.

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
localhost:9090      (Prometheus)
node01:9100         (Web Server)
node02:9100         (Web Server)
loadbalancer:9100   (Load Balancer)
localhost:8000      (API Service)
```

All targets reported a healthy status (`UP`) during the lab execution.

---

# PromQL Operators

PromQL operators allow metric comparison and filtering based on numerical conditions.

## Comparison Operator

Example:

```promql
node_filesystem_avail_bytes{job="web"} > 1000
```

Purpose:

Return filesystem metrics where available disk space is greater than 1000 bytes.

---

## Logical Operator

Example:

```promql
node_filesystem_files > 500000 and node_filesystem_files < 10000000
```

Purpose:

Filter filesystems whose file count falls within a specific range.

---

# Aggregation Functions

Aggregation operators summarize data across multiple time series.

---

## Sum Aggregator

Example:

```promql
sum(node_filesystem_size_bytes{instance="loadbalancer:9100"})
```

Purpose:

Calculate total filesystem capacity available on the load balancer host.

---

## Count Aggregator

Example:

```promql
count(node_cpu_seconds_total{instance="loadbalancer:9100", mode="idle"})
```

Purpose:

Count CPU cores reporting idle metrics.

---

## Grouped Count Aggregation

Example:

```promql
count(node_cpu_seconds_total{mode="idle"}) by (instance)
```

Purpose:

Count CPU cores per monitored host.

---

## Grouped Sum Aggregation

Example:

```promql
sum by(instance) (node_network_receive_bytes_total)
```

Purpose:

Calculate total received network traffic grouped by host.

---

# Vector Matching

Vector matching enables comparisons between multiple metric vectors.

PromQL automatically matches vectors using shared labels such as:

```text
instance
job
device
cpu
mode
```

Vector matching is useful when combining metrics from multiple targets or performing arithmetic operations between different metric sets.

Examples commonly include:

```promql
metric_a / metric_b
```

```promql
metric_a + metric_b
```

```promql
metric_a * metric_b
```

When label sets differ, PromQL supports modifiers such as:

```promql
on()
ignoring()
group_left()
group_right()
```

These modifiers help define how vectors should be matched during evaluation.

# Queries Executed

## Query 1 – Comparison Operator

```promql
node_filesystem_avail_bytes{job="web"} > 1000
```

**Purpose**

Return filesystem metrics where available disk space is greater than 1000 bytes.

---

## Query 2 – Comparison Operator

```promql
node_network_receive_bytes_total{instance="loadbalancer:9100"} <= 10000
```

**Purpose**

Return all network interfaces on the load balancer that have received less than or equal to 10,000 bytes of traffic.

**Concepts Used**

* Comparison operators
* Metric filtering
* Label selectors

---

## Query 3 – Logical Operator

```promql
node_filesystem_files > 500000 and node_filesystem_files < 10000000
```

**Purpose**

Filter filesystems whose file count falls within a specific range.

**Concepts Used**

* Logical operators
* Boolean evaluation
* Metric filtering

---

## Query 4 – Arithmetic Operator

```promql
node_filesystem_avail_bytes{job="web", device!="tmpfs"} * 100
/
node_filesystem_size_bytes{job="web", device!="tmpfs"}
```

**Purpose**

Calculate available filesystem space as a percentage of total capacity while excluding temporary filesystems.

**Concepts Used**

* Arithmetic operators
* Label filtering
* Percentage calculations

---

## Query 5 – Vector Matching with Ignoring

```promql
node_cpu_seconds_total{instance="loadbalancer:9100", mode="user"}
+
ignoring(mode)
node_cpu_seconds_total{instance="loadbalancer:9100", mode="system"}
```

**Purpose**

Combine user CPU time and system CPU time while ignoring the `mode` label during vector matching.

**Concepts Used**

* Vector matching
* `ignoring()`
* Arithmetic operations between vectors

---

## Query 6 – Sum Aggregator

```promql
sum(node_filesystem_size_bytes{instance="loadbalancer:9100"})
```

**Purpose**

Calculate total filesystem capacity available on the load balancer host.

**Concepts Used**

* Aggregation
* `sum()`

---

## Query 7 – Count Aggregator

```promql
count(node_cpu_seconds_total{instance="loadbalancer:9100", mode="idle"})
```

**Purpose**

Count CPU cores reporting idle metrics.

**Concepts Used**

* Aggregation
* `count()`

---

## Query 8 – Grouped Aggregation

```promql
count(node_cpu_seconds_total{mode="idle"}) by (instance)
```

**Purpose**

Count CPU cores per monitored host.

**Concepts Used**

* Aggregation
* Grouping with `by()`

---

## Query 9 – Aggregation Arithmetic

```promql
sum(node_network_receive_bytes_total)
/
sum(node_network_receive_packets_total)
```

**Purpose**

Calculate the average number of bytes received per network packet across all monitored systems.

**Concepts Used**

* Aggregation
* Arithmetic operators
* Infrastructure traffic analysis

---

## Query 10 – Aggregation Exercise

PromQL aggregation exercise executed through the Prometheus Expression Browser.

**Purpose**

Analyze metric aggregation behavior and understand how aggregated vectors are evaluated.

---

## Query 11 – Vector Matching with Ignoring and Aggregation

```promql
node_cpu_seconds_total{mode="user"} * 100
/
ignoring(mode, job)
sum by(instance, cpu) (node_cpu_seconds_total)
```

**Purpose**

Calculate the percentage of CPU time spent in user mode per CPU core.

**Concepts Used**

* Aggregation
* Vector matching
* `ignoring()`
* CPU utilization analysis

---

## Query 12 – Group Left Vector Matching

```promql
http_upload_failed_bytes_total * 100
/
ignoring(error)
group_left
http_uploaded_bytes_total
```

**Purpose**

Calculate upload failure percentages while preserving labels from the left-hand metric.

**Concepts Used**

* Vector matching
* `group_left`
* Label cardinality handling
* Error rate calculations


# Active Targets Validation

Prometheus successfully scraped metrics from all configured targets.

Observed target groups:

```text
prometheus
web
loadbalancer
api
```

All targets reported:

```text
health = up
```

which confirms successful monitoring and data collection.

---

# Evidence Collected

The following files were generated during lab execution:

### operators-lab.txt

Contains:

* Prometheus version
* Prometheus configuration
* Active targets
* Executed queries
* Environment information
* Supporting evidence

### active-targets.json

Contains target discovery information and target health status.

### query1.txt

Contains comparison operator examples.

### query3.txt

Contains logical operator examples.

### query6.txt

Contains aggregation examples using `sum()`.

### query7.txt

Contains aggregation examples using `count()`.

### query8.txt

Contains grouped aggregation results.

### query9.txt

Contains grouped network metric aggregation results.

---

# Repository Structure

```text
prometheus/
└── prometheus-promql-operators-aggregators/
    ├── README.md
    ├── screenshots/
    ├── outputs/
    │   ├── operators-lab.txt
    │   ├── active-targets.json
    │   ├── query1.txt
    │   ├── query3.txt
    │   ├── query6.txt
    │   ├── query7.txt
    │   ├── query8.txt
    │   └── query9.txt
    └── manifests/
        └── prometheus.yml
```

---

# Skills Demonstrated

* Prometheus Monitoring
* PromQL Query Development
* Comparison Operators
* Logical Operators
* Aggregation Functions
* Vector Matching
* Infrastructure Analysis
* Metric Correlation
* Observability Fundamentals
* Linux Administration

---

# Key Takeaways

This lab provided hands-on experience working with PromQL operators, vector matching, and aggregation functions. By analyzing filesystem, CPU, and network metrics across multiple monitored systems, it became possible to understand how Prometheus evaluates and aggregates data at scale. These concepts are essential for infrastructure monitoring, troubleshooting, observability engineering, and preparation for the Prometheus Certified Associate (PCA) certification.
