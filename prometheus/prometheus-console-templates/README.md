# Console Templates

## Overview

In this lab, I learned how to use **Prometheus Console Templates** to create custom monitoring dashboards directly within the Prometheus web interface. Console templates allow administrators and DevOps engineers to build dynamic HTML pages that display Prometheus metrics using PromQL queries without requiring external visualization tools.

The lab focused on understanding the default console structure, configuring Prometheus to serve console pages, creating a custom template, and validating that the template successfully rendered live infrastructure metrics collected from Node Exporter targets.

---

## Objectives

- Explore Prometheus console template functionality.
- Understand the purpose of the `consoles` and `console_libraries` directories.
- Review Prometheus web console configuration.
- Create a custom console template.
- Display live Node Exporter metrics through PromQL queries.
- Verify template rendering through the Prometheus web interface.
- Validate Prometheus service configuration and status.

---

## Environment Information

### Prometheus Version

```bash
prometheus, version 2.40.1
```

### Monitored Targets

| Job | Target |
|------|---------|
| prometheus | localhost:9090 |
| nodes | node01:9100 |
| nodes | node02:9100 |

### Prometheus Service

```bash
systemctl status prometheus
```

Service status:

```text
active (running)
```

---

## Console Template Architecture

Prometheus uses two directories for console rendering:

### Console Templates

```text
/etc/prometheus/consoles
```

Contains HTML templates that generate dashboard pages.

### Console Libraries

```text
/etc/prometheus/console_libraries
```

Contains reusable template components and helper functions used by console pages.

---

## Existing Console Files

The Prometheus installation already included several built-in console templates:

```text
/etc/prometheus/consoles/node-overview.html
/etc/prometheus/consoles/node-disk.html
/etc/prometheus/consoles/node-cpu.html
/etc/prometheus/consoles/node.html
/etc/prometheus/consoles/prometheus.html
/etc/prometheus/consoles/prometheus-overview.html
```

Library files:

```text
/etc/prometheus/console_libraries/menu.lib
/etc/prometheus/console_libraries/prom.lib
```

---

## Prometheus Console Configuration

The Prometheus service was configured with console support enabled.

```bash
--web.console.templates=/etc/prometheus/consoles
--web.console.libraries=/etc/prometheus/console_libraries
```

These parameters allow Prometheus to load custom HTML templates and shared libraries.

---

## Custom Console Template

A new console template named:

```text
node-stats.html
```

was created inside:

```text
/etc/prometheus/consoles
```

The template uses PromQL queries to display:

- Node instances
- CPU metrics
- Memory information

The page dynamically retrieves data from Prometheus using the built-in template query functions.

---

## Validation Steps

### Verify Console Directories

```bash
find /etc/prometheus -type d
```

### Verify Console Files

```bash
find /etc/prometheus -type f | grep -Ei "console|tmpl|html"
```

### Verify Service Configuration

```bash
grep -R "console" /etc/systemd/system/prometheus.service
```

### Verify Prometheus Status

```bash
systemctl status prometheus
```

### Verify Active Targets

```bash
curl -s http://localhost:9090/api/v1/targets
```

---

## Evidence Collected

The following evidence was gathered during the lab:

### Prometheus Version

```text
prometheus 2.40.1
```

### Active Monitoring Targets

```text
localhost:9090
node01:9100
node02:9100
```

### Console Directories

```text
/etc/prometheus/consoles
/etc/prometheus/console_libraries
```

### Custom Console Template

```text
/etc/prometheus/consoles/node-stats.html
```

### Prometheus Service

```text
active (running)
```

---

## Repository Structure

```text
prometheus-console-templates/
├── README.md
├── manifests
│   ├── prometheus.yml
│   └── node-stats.html
├── outputs
│   └── console-templates.txt
└── screenshot
```

---

## Files Included

### manifests/prometheus.yml

Contains the Prometheus configuration used during the lab.

### manifests/node-stats.html

Custom console template created to display Node Exporter metrics.

### outputs/console-templates.txt

Evidence file containing:

- Prometheus version
- Prometheus configuration
- Active targets
- Console directories
- Console files
- Service status
- Template validation results

---

## Skills Demonstrated

- Prometheus Administration
- PromQL Fundamentals
- Monitoring Infrastructure Metrics
- Node Exporter Integration
- Console Template Development
- Linux System Administration
- Service Management with systemd
- Infrastructure Observability
- Monitoring Dashboard Creation

---

## Key Takeaways

This lab demonstrated how Prometheus Console Templates can be used to create lightweight monitoring dashboards directly within Prometheus. By leveraging PromQL queries and HTML templates, it is possible to present infrastructure metrics without requiring external visualization platforms. The exercise reinforced Prometheus configuration management, template customization, metric querying, and monitoring best practices for observability environments.
