# Chart Hooks

## Overview

This lab demonstrates how to use **Helm Hooks** to execute Kubernetes resources at specific points during a chart lifecycle.

The objective was to understand how Helm can trigger additional actions automatically after chart installation and upgrades by using hook annotations.

During this lab, two Kubernetes Jobs were implemented:

* Post-install Hook
* Post-upgrade Hook

These Jobs execute automatically when a Helm release is installed or upgraded.

---

## Course Information

**Course:** Helm for Beginners  
**Platform:** KodeKloud

**Lab:** Chart Hooks

---


## Technologies Used

* Helm
* Kubernetes
* YAML
* Linux
* KodeKloud Labs

---

## Repository Structure

```text
└── README.md
└── screenshot/
└── helm-chart-hooks/
    ├── README.md
    ├── webapp/
    │   ├── Chart.yaml
    │   ├── values.yaml
    │   └── templates/
    │       ├── deployment.yaml
    │       ├── service.yaml
    │       ├── serviceaccount.yaml
    │       ├── install-job.yaml
    │       ├── upgrade-job.yaml
    │       ├── _helpers.tpl
    │       └── NOTES.txt
    │
    └── webapp-color/
        ├── Chart.yaml
        ├── values.yaml
        └── templates/
            ├── deployment.yaml
            ├── service.yaml
            ├── serviceaccount.yaml
            ├── configmap.yaml
            └── _helpers.tpl
```

---

## Chart Metadata

### Chart.yaml

```yaml
apiVersion: v2
appVersion: 2.4.51
description: An Apache Application
name: webapp
type: application
version: 0.2
```

This file defines the Helm chart metadata, including chart name, application version, chart version, and description.

---

## Configuration Values

### values.yaml

```yaml
replicaCount: 1

image:
  repository: httpd
  pullPolicy: IfNotPresent
  tag: ""

nameOverride: webapp
fullnameOverride: my-webapp

serviceAccount:
  create: true
  name: webapp

service:
  type: NodePort
  port: 80
  nodePort: 31080
```

The values file centralizes chart configuration and allows customization without modifying templates.

---

## Deployment Template

### templates/deployment.yaml

Key concepts implemented:

* Deployment resource creation
* Dynamic image selection
* Configurable replica count
* Service Account integration
* Readiness and Liveness Probes

Example:

```yaml
image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
```

The application image version defaults to the chart AppVersion when no custom tag is provided.

---

## Service Template

### templates/service.yaml

```yaml
spec:
  type: {{ .Values.service.type }}
```

The service type is dynamically generated from values.yaml.

Configured Service:

```yaml
type: NodePort
nodePort: 31080
```

This exposes the application outside the cluster through a NodePort service.

---

## Service Account

### templates/serviceaccount.yaml

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ .Values.serviceAccount.name }}
```

A dedicated ServiceAccount is created and attached to the application workload.

---

## Helm Helper Templates

### templates/_helpers.tpl

This file contains reusable Helm template functions used throughout the chart:

* webapp.name
* webapp.fullname
* webapp.chart
* webapp.labels
* webapp.selectorLabels
* webapp.serviceAccountName

These helper functions improve chart maintainability and reduce template duplication.

---

## Helm Hooks

### Post-Install Hook

File:

```text
templates/install-job.yaml
```

Implementation:

```yaml
metadata:
  name: install-hook
  annotations:
    "helm.sh/hook": post-install
```

Job definition:

```yaml
containers:
- name: install-hook
  image: alpine
  command: ["echo", "Successful Installation"]
```

Purpose:

This Job executes automatically after a successful Helm installation.

---

### Post-Upgrade Hook

File:

```text
templates/upgrade-job.yaml
```

Implementation:

```yaml
metadata:
  name: upgrade-hook
  annotations:
    "helm.sh/hook": post-upgrade
```

Job definition:

```yaml
containers:
- name: upgrade-hook
  image: alpine
  command: ["echo", "Successful Upgradation"]
```

Purpose:

This Job executes automatically after a successful Helm upgrade.

---

## Hook Lifecycle

### Installation

```bash
helm install webapp .
```

Execution sequence:

1. Kubernetes resources are deployed.
2. Helm completes installation.
3. Post-install hook executes.
4. Job prints:

```text
Successful Installation
```

---

### Upgrade

```bash
helm upgrade webapp .
```

Execution sequence:

1. Helm updates Kubernetes resources.
2. Upgrade finishes successfully.
3. Post-upgrade hook executes.
4. Job prints:

```text
Successful Upgradation
```

---

## Commands Executed

### Validate Chart

```bash
helm lint .
```

### Render Templates

```bash
helm template .
```

### Install Chart

```bash
helm install webapp .
```

### Upgrade Release

```bash
helm upgrade webapp .
```

### List Releases

```bash
helm list
```

### View Jobs

```bash
kubectl get jobs
```

### View Job Logs

```bash
kubectl logs job/install-hook
```

```bash
kubectl logs job/upgrade-hook
```

### Uninstall Release

```bash
helm uninstall webapp
```

---

## Key Concepts Learned

### Helm Hooks

Hooks allow Kubernetes resources to execute at specific lifecycle events during chart operations.

Examples:

* pre-install
* post-install
* pre-upgrade
* post-upgrade
* pre-delete
* post-delete

---

### Kubernetes Jobs

Jobs execute one-time tasks and terminate when completed successfully.

They are commonly used for:

* Database migrations
* Initialization tasks
* Data validation
* Notifications
* Post-deployment actions

---

### Template Reusability

Helper templates (_helpers.tpl) enable reusable naming, labeling, and resource generation logic across multiple Kubernetes manifests.

---

## Learning Outcomes

Through this lab, I gained practical experience with:

* Helm lifecycle management
* Helm Hook annotations
* Post-install automation
* Post-upgrade automation
* Kubernetes Jobs
* Helm templating
* Reusable helper templates
* Kubernetes application deployment using Helm

---

## References

* Helm Documentation: https://helm.sh/docs/topics/charts_hooks/
* Kubernetes Jobs Documentation: https://kubernetes.io/docs/concepts/workloads/controllers/job/


```
```
