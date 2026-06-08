# Lab - Re-Labeling

## Description

In this lab, Prometheus relabeling techniques were explored to modify, rename, and remove labels from collected metrics. The exercise focused on using `metric_relabel_configs` and File Service Discovery (`file_sd_configs`) to control how target metadata and metric labels are processed before being stored in Prometheus.

The lab demonstrates how relabeling can be used to standardize metric naming conventions, remove unnecessary labels, and enrich monitoring data with metadata that improves filtering and querying capabilities.

---

## Objectives

* Understand Prometheus relabeling concepts.
* Configure metric relabeling rules.
* Rename existing labels.
* Remove unnecessary labels.
* Configure File Service Discovery.
* Validate label transformations through Prometheus targets.
* Analyze discovered targets and metadata.

---

## Technologies Used

* Prometheus
* File Service Discovery (File SD)
* Node Exporter
* Linux
* YAML
* JSON

---

## Repository Structure

```text
prometheus-re-labeling/
├── README.md
├── manifests/
│   ├── prometheus.yml
│   └── file-sd.json
├── outputs/
│   └── relabeling.txt
└── screenshot/
```

---

## Environment Configuration

The Prometheus server was configured with multiple scrape jobs:

* Prometheus self-monitoring
* Node Exporter targets
* File Service Discovery targets

### Scrape Jobs

```yaml
scrape_configs:
  - job_name: "prometheus"

  - job_name: "nodes"

  - job_name: "demo"
```

---

## Metric Re-Labeling

The laboratory focused on modifying metric labels before ingestion into the TSDB.

### Rename Label

The `device` label was renamed to `interface`.

```yaml
metric_relabel_configs:
  - source_labels: [device]
    regex: (.*)
    target_label: interface
    replacement: $1
    action: replace
```

### Remove Label

After creating the new label, the original label was removed.

```yaml
metric_relabel_configs:
  - regex: device
    action: labeldrop
```

### Result

Before relabeling:

```text
device="eth0"
```

After relabeling:

```text
interface="eth0"
```

The original `device` label was no longer stored.

---

## File Service Discovery

Prometheus was configured to load targets dynamically from a JSON file.

### Configuration

```yaml
file_sd_configs:
  - files:
      - /etc/prometheus/file-sd.json
```

### File Used

```text
/etc/prometheus/file-sd.json
```

---

## Target Metadata

The discovered targets contained custom metadata attributes.

### Example Metadata

```text
env
team
type
os
cpu
mem
```

Examples observed during the lab:

| Label | Example Value |
| ----- | ------------- |
| env   | prod          |
| env   | staging       |
| env   | dev           |
| team  | api           |
| team  | database      |
| type  | mysql         |
| type  | postgres      |
| type  | python        |
| type  | nodejs        |

---

## Target Discovery Validation

Prometheus successfully loaded targets from the File SD configuration.

Example discovered targets:

```text
node1
node2
node3
node4
node5
node6
node7
node8
```

Each target included metadata labels that were automatically attached by Prometheus.

Example:

```text
env="prod"
team="database"
type="mysql"
```

---

## Prometheus Service Configuration

The Prometheus service was configured with console support and custom configuration loading.

### Service Parameters

```text
--config.file=/etc/prometheus/prometheus.yml
--storage.tsdb.path=/var/lib/prometheus
--web.console.templates=/etc/prometheus/consoles
--web.console.libraries=/etc/prometheus/console_libraries
--web.listen-address=0.0.0.0:9090
```

---

## Validation

### Verify Configuration

```bash
cat /etc/prometheus/prometheus.yml
```

### Verify Targets

```bash
curl http://localhost:9090/api/v1/targets
```

### Verify Relabel Rules

```bash
grep -R "relabel" /etc/prometheus
```

### Verify Service

```bash
cat /etc/systemd/system/prometheus.service
```

---

## Observations

The targets loaded through File Service Discovery appeared with a **DOWN** status because the hostnames used in the laboratory environment were examples and were not resolvable within the lab infrastructure.

Example:

```text
node1
node2
node3
node4
node5
node6
node7
node8
```

This behavior is expected and does not affect the relabeling functionality being demonstrated.

The objective of the lab was to validate target discovery and label processing rather than target availability.

---

## Evidence Collected

The following evidence was gathered during the laboratory:

### Configuration Files

* Prometheus configuration
* File SD configuration

### Validation Outputs

* Prometheus Targets API response
* Relabeling configuration verification
* Service configuration verification

### Output File

```text
outputs/relabeling.txt
```

---

## Key Concepts Learned

* Prometheus relabeling workflow.
* Metric relabeling using `metric_relabel_configs`.
* Label replacement using `replace`.
* Label removal using `labeldrop`.
* File Service Discovery.
* Dynamic target management.
* Metadata enrichment.
* Label standardization strategies.
* Prometheus target discovery process.

---

## Result

Prometheus was successfully configured to use metric relabeling and File Service Discovery. Labels were transformed using replacement and label removal actions, demonstrating how Prometheus can normalize and enrich monitoring data before storage. Dynamic targets were loaded from a JSON configuration file, validating the integration between File SD and relabeling mechanisms.
