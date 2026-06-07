# PromQL Selectors, Matchers, and Modifiers

## Overview

This lab focuses on using **PromQL (Prometheus Query Language)** to retrieve, filter, and analyze metrics collected by Prometheus.

The objective is to understand how to work with:

* Metric selectors
* Label matchers
* Regular expressions
* Time modifiers
* Instant vectors
* Range vectors
* Offset queries

During the lab, Prometheus was used to query metrics from monitored Linux nodes running Node Exporter and to validate different filtering techniques through the Prometheus Expression Browser.

---

## Technologies Used

![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge\&logo=prometheus\&logoColor=white)
![PromQL](https://img.shields.io/badge/PromQL-Query%20Language-orange?style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge\&logo=linux\&logoColor=black)
![Node Exporter](https://img.shields.io/badge/Node%20Exporter-339933?style=for-the-badge)
![Monitoring](https://img.shields.io/badge/Monitoring-005571?style=for-the-badge)

---

## Learning Objectives

* Understand PromQL syntax.
* Query metrics using selectors.
* Filter metrics using label matchers.
* Use regex matchers.
* Work with range vectors.
* Analyze historical data using offsets.
* Validate query results from Prometheus UI.

---

## Environment Information

### Prometheus Server

```bash
prometheus --version
```

Example:

```text
prometheus, version 3.5.0
```

### Monitored Targets

```text
node01:9100
node02:9100
localhost:9090
```

---

# PromQL Selectors

Selectors are the simplest PromQL queries and allow retrieving all samples for a given metric.

Example:

```promql
node_cpu_seconds_total
```

This returns all CPU metrics collected from every monitored node.

---

# Label Matchers

PromQL allows filtering metrics based on labels.

## Equality Matcher

```promql
node_cpu_seconds_total{cpu="0"}
```

Returns metrics only for CPU core 0.

---

## Inequality Matcher

```promql
node_cpu_seconds_total{cpu!="0"}
```

Returns metrics for all CPUs except CPU 0.

---

## Matching by Mode

```promql
node_cpu_seconds_total{mode="idle"}
```

Returns idle CPU metrics.

---

# Regular Expression Matchers

Regex filtering is supported through the `=~` operator.

Example:

```promql
node_cpu_seconds_total{cpu=~"0|1"}
```

Returns metrics from CPU 0 and CPU 1 only.

---

## Excluding Values Using Regex

```promql
node_cpu_seconds_total{cpu!~"0|1"}
```

Returns all CPUs except 0 and 1.

---

# Instant Vector Queries

Instant vectors return the most recent sample value.

Example:

```promql
node_memory_MemAvailable_bytes
```

Returns current available memory.

---

# Range Vector Queries

Range vectors retrieve metric samples across a time interval.

Example:

```promql
node_memory_MemAvailable_bytes[5m]
```

Returns memory samples collected during the last five minutes.

---

## CPU Usage Over Time

```promql
node_cpu_seconds_total[5m]
```

Returns CPU samples collected during the last five minutes.

---

# Offset Modifier

The offset modifier allows querying historical metric values.

Example:

```promql
node_memory_MemAvailable_bytes offset 5m
```

Returns memory values from five minutes ago.

---

## Historical CPU Metrics

```promql
node_cpu_seconds_total offset 10m
```

Returns CPU metrics from ten minutes earlier.

---

# Practical Queries Executed

## Query 1

```promql
node_cpu_seconds_total
```

Purpose:

Retrieve all CPU metrics.

---

## Query 2

```promql
node_cpu_seconds_total{cpu="0"}
```

Purpose:

Filter CPU metrics for core 0.

---

## Query 3

```promql
node_cpu_seconds_total{mode="idle"}
```

Purpose:

Analyze idle CPU time.

---

## Query 4

```promql
node_cpu_seconds_total{cpu=~"0|1"}
```

Purpose:

Filter metrics using regular expressions.

---

## Query 5

```promql
node_memory_MemAvailable_bytes
```

Purpose:

View available memory.

---

## Query 6

```promql
node_memory_MemAvailable_bytes[5m]
```

Purpose:

Retrieve memory history for five minutes.

---

## Query 7

```promql
node_memory_MemAvailable_bytes offset 5m
```

Purpose:

Retrieve historical memory data.

---

## Evidence Collected

The following evidence files were collected during the lab execution:

### active-targets.json

Contains the Prometheus target discovery information and target health status.

### promql-selectors.txt

Contains examples and results of PromQL metric selectors.

### promql-matchers.txt

Contains examples and results of label matchers and regex matchers.

### promql-modifiers.txt

Contains examples and results of offset and time-based query modifiers.

### query-results.txt

Contains query outputs generated during the lab validation process.
## Repository Structure

```text
prometheus/
└── prometheus-promql-selectors-modifiers/
    ├── README.md
    ├── screenshot/
    ├── outputs/
    │   ├── active-targets.json
    │   ├── promql-selectors.txt
    │   ├── promql-matchers.txt
    │   ├── promql-modifiers.txt
    │   └── query-results.txt
    └── manifest/
        ├── prometheus.yaml

```

---

# Skills Demonstrated

* Prometheus Monitoring
* PromQL Query Development
* Metric Filtering
* Label Matchers
* Regex Matchers
* Instant Vectors
* Range Vectors
* Historical Metric Analysis
* Infrastructure Monitoring
* Linux Administration

---

# Key Takeaways

This lab provided practical experience using PromQL to retrieve and analyze metrics collected by Prometheus. By working with selectors, label matchers, regular expressions, and time modifiers, it became possible to efficiently query infrastructure metrics and gain deeper visibility into monitored systems. These skills are fundamental for troubleshooting, observability, performance analysis, and preparing for the Prometheus Certified Associate (PCA) certification.
"""
