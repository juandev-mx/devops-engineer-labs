# Lab - Monitor ArgoCD with Prometheus, Grafana, AlertManager

## Overview

In this lab, I configured a monitoring stack for ArgoCD using **Prometheus**, **Grafana**, and **AlertManager** within a Kubernetes cluster. The objective was to collect metrics exposed by ArgoCD components, visualize them through Grafana dashboards, and configure alerting capabilities using AlertManager.

The monitoring platform was deployed using the **kube-prometheus-stack Helm chart**, which automatically installed Prometheus, Grafana, AlertManager, exporters, and monitoring CRDs.

Additionally, an ArgoCD application was deployed and monitored to validate metric collection and dashboard visualization.

---

## Objectives

- Deploy Prometheus, Grafana, and AlertManager using Helm.
- Install the kube-prometheus-stack monitoring solution.
- Verify Prometheus Operator and monitoring CRDs.
- Expose ArgoCD metrics endpoints.
- Monitor ArgoCD applications and Kubernetes resources.
- Validate Grafana dashboards and Prometheus targets.
- Configure AlertManager integration.
- Observe ArgoCD application health and synchronization status.

---

## Architecture

```text
┌─────────────────────────────────────────────┐
│                   ArgoCD                    │
│                                             │
│  Application Controller                     │
│  Repo Server                                │
│  API Server                                 │
│  ApplicationSet Controller                  │
└─────────────────┬───────────────────────────┘
                  │ Metrics
                  ▼
┌─────────────────────────────────────────────┐
│                Prometheus                   │
│                                             │
│  Scrapes ArgoCD Metrics                     │
│  Stores Time-Series Data                    │
└─────────────────┬───────────────────────────┘
                  │
        ┌─────────┴─────────┐
        ▼                   ▼
┌──────────────┐   ┌─────────────────┐
│   Grafana    │   │  AlertManager   │
│ Dashboards   │   │ Notifications   │
└──────────────┘   └─────────────────┘
```

---

## Technologies Used

- Kubernetes
- ArgoCD
- Prometheus
- Grafana
- AlertManager
- Helm
- kube-prometheus-stack
- Prometheus Operator
- ServiceMonitor
- GitOps

---

## Repository Structure

```text
argocd-monitor-argocd-with-prometheus-grafana-alertmanager/
│
├── README.md
├── argocd-metrics.yaml
├── argocd-server-metrics.yaml
├── argocd-repo-server-metrics.yaml
├── argocd-applicationset-controller-metrics.yaml
├── outputs/
│   ├── helm-list.txt
│   ├── argocd-app-list.txt
│   ├── kubectl-get-all-monitoring.txt
│   └── monitoring-crds.txt
└── screenshots/
```

---

## Environment Validation

### ArgoCD Application

```bash
argocd app list
```

Output:

```text
NAME                       STATUS   HEALTH
alert-manager-demo         Synced   Healthy
```

---

### Verify Application Details

```bash
argocd app get alert-manager-demo
```

Application information:

- Namespace: `alert-demo`
- Repository: GitOps Repository
- Path: `./solar-system`
- Sync Status: Synced
- Health Status: Healthy

---

## Install Monitoring Stack

### Verify Helm Installation

```bash
helm list -A
```

Output:

```text
NAME                            NAMESPACE
kode-kloud-prometheus-stack     monitoring
```

Chart:

```text
kube-prometheus-stack-35.3.0
```

---

## Prometheus Components

### Verify Prometheus Pods

```bash
kubectl get pods -A | grep prometheus
```

Observed:

```text
prometheus-kode-kloud-prometheus-stac-prometheus-0
```

---

### Verify Prometheus Service

```bash
kubectl get svc -n monitoring
```

Service:

```text
kode-kloud-prometheus-stac-prometheus
```

NodePort:

```text
30040
```

---

## Grafana Deployment

### Verify Grafana Pod

```bash
kubectl get pods -n monitoring
```

Observed:

```text
kode-kloud-prometheus-stack-grafana
```

### Verify Grafana Service

```bash
kubectl get svc -n monitoring
```

Output:

```text
kode-kloud-prometheus-stack-grafana
```

NodePort:

```text
30050
```

---

## AlertManager Deployment

### Verify AlertManager Pod

```bash
kubectl get pods -n monitoring
```

Observed:

```text
alertmanager-kode-kloud-prometheus-stac-alertmanager-0
```

### Verify AlertManager Service

```bash
kubectl get svc -n monitoring
```

Output:

```text
kode-kloud-prometheus-stac-alertmanager
```

NodePort:

```text
30030
```

---

##  Monitoring CRDs

Verify Prometheus Operator resources:

```bash
kubectl get crd | grep monitoring
```

Observed CRDs:

```text
alertmanagerconfigs.monitoring.coreos.com
alertmanagers.monitoring.coreos.com
prometheuses.monitoring.coreos.com
prometheusrules.monitoring.coreos.com
```

---

## ArgoCD Metrics Configuration

Metrics manifests were prepared for the main ArgoCD components.

### ArgoCD API Server Metrics

```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
```

File:

```text
argocd-server-metrics.yaml
```

---

### ArgoCD Application Controller Metrics

File:

```text
argocd-metrics.yaml
```

---

### ArgoCD Repo Server Metrics

File:

```text
argocd-repo-server-metrics.yaml
```

---

### ArgoCD ApplicationSet Controller Metrics

File:

```text
argocd-applicationset-controller-metrics.yaml
```

---

## Grafana Dashboards

The monitoring stack automatically provisioned dashboards through ConfigMaps.

Examples discovered:

```bash
kubectl get configmap -n monitoring
```

Available dashboards:

```text
kode-kloud-prometheus-stac-grafana-overview
kode-kloud-prometheus-stac-prometheus
kode-kloud-prometheus-stac-cluster-total
kode-kloud-prometheus-stac-pod-total
kode-kloud-prometheus-stac-workload-total
```

These dashboards provide visibility into:

- Cluster health
- Node resource utilization
- Pod metrics
- Kubernetes workloads
- Prometheus performance
- ArgoCD metrics

---

## ArgoCD Deployment Under Monitoring

Application monitored:

```text
alert-manager-demo
```

Namespace:

```text
alert-demo
```

Resources:

```text
Deployment: solar-system
Service: solar-system-service
```

Image:

```text
siddharth67/solar-system:v9
```

Health:

```text
Healthy
```

Sync Status:

```text
Synced
```

---

## ✅ Validation Commands

### List Applications

```bash
argocd app list
```

### Verify Application

```bash
argocd app get alert-manager-demo
```

### Verify Monitoring Components

```bash
kubectl get all -A | grep -Ei "prometheus|grafana|alertmanager"
```

### Verify Helm Releases

```bash
helm list -A
```

### Verify Monitoring CRDs

```bash
kubectl get crd | grep monitoring
```

### Verify Dashboards

```bash
kubectl get configmap -n monitoring
```

---

## Concepts Learned

- GitOps monitoring with ArgoCD.
- Prometheus metrics collection.
- Grafana dashboard visualization.
- AlertManager alert processing.
- Helm-based monitoring deployment.
- Prometheus Operator architecture.
- Kubernetes monitoring CRDs.
- Service discovery and scraping.
- Monitoring ArgoCD applications.
- Production-grade observability practices.

---

## Lab Result

Successfully deployed and validated a complete monitoring stack composed of **Prometheus**, **Grafana**, and **AlertManager**. The environment was capable of collecting Kubernetes and ArgoCD metrics, visualizing operational data through Grafana dashboards, and providing the foundation for automated alerting and observability in a GitOps-driven infrastructure.
