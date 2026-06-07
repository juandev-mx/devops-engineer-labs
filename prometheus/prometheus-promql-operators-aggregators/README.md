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

---

# Queries Executed

## Query 1

```promql
node_filesystem_avail_bytes{job="web"} > 1000
```

Purpose:

Validate filesystem availability on web servers.

---

## Query 2

PromQL operator exercise executed through the Prometheus Expression Browser.

Purpose:

Practice metric filtering using comparison operators.

---

## Query 3

```promql
node_filesystem_files > 500000 and node_filesystem_files < 10000000
```

Purpose:

Filter filesystems using logical conditions.

---

## Query 4

PromQL operator exercise executed through the Prometheus Expression Browser.

Purpose:

Practice additional operator-based filtering.

---

## Query 5

PromQL operator exercise executed through the Prometheus Expression Browser.

Purpose:

Explore logical and arithmetic evaluation behavior.

---

## Query 6

```promql
sum(node_filesystem_size_bytes{instance="loadbalancer:9100"})
```

Purpose:

Calculate total filesystem capacity for the load balancer.

---

## Query 7

```promql
count(node_cpu_seconds_total{instance="loadbalancer:9100", mode="idle"})
```

Purpose:

Count idle CPU metrics on the load balancer.

---

## Query 8

```promql
count(node_cpu_seconds_total{mode="idle"}) by (instance)
```

Purpose:

Count idle CPU metrics grouped by host.

---

## Query 9

```promql
sum by(instance) (node_network_receive_bytes_total)
```

Purpose:

Calculate total incoming network traffic grouped by host.

---

## Query 10

Aggregation and vector matching exercise executed through the Prometheus Expression Browser.

Purpose:

Analyze metric aggregation behavior.

---

## Query 11

Advanced PromQL exercise executed through the Prometheus Expression Browser.

Purpose:

Practice combining operators and aggregation functions.

---

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
