# ArgoCD Application Custom Health Check and Synchronization

## Overview

This lab demonstrates how ArgoCD continuously monitors Kubernetes applications and automatically reconciles the desired state stored in Git with the actual state running in the cluster.

The exercise focuses on:

* Application Health Monitoring
* Custom Health Checks
* Automated Synchronization
* Self-Healing
* Automatic Resource Pruning
* GitOps Continuous Reconciliation

---

## Technologies Used

* Kubernetes
* ArgoCD
* GitOps
* YAML
* ConfigMaps
* Deployments

---

## Lab Architecture

```text
Git Repository
       |
       v
    ArgoCD
       |
       v
 Kubernetes Cluster
       |
       v
health-check Namespace
```

---

## Application Configuration

### Application Name

```text
health-check-app
```

### Namespace

```text
health-check
```

### Sync Policy

```yaml
automated:
  prune: true
  selfHeal: true
```

### Sync Options

```yaml
syncOptions:
  - CreateNamespace=true
```

---

## Resources Managed by ArgoCD

### Deployment

```text
random-shapes
```

### ConfigMap

```text
moving-shapes-colors
```

---

## Validation Commands

### List Applications

```bash
argocd app list
```

### Get Application Details

```bash
argocd app get health-check-app
```

### View Resources

```bash
argocd app resources health-check-app
```

### View Synchronization History

```bash
argocd app history health-check-app
```

### Inspect Application Manifest

```bash
kubectl get application health-check-app \
-n argocd \
-o yaml
```

---

## Reconciliation Demonstration

ArgoCD continuously compared the desired state defined in Git with the actual cluster state.

Whenever a change was detected:

* ArgoCD identified the drift.
* The application became OutOfSync.
* Synchronization was automatically triggered.
* Resources returned to the desired state.

---

## Self-Healing

Self-healing was enabled through:

```yaml
selfHeal: true
```

This allowed ArgoCD to automatically restore resources when manual modifications were performed directly inside the cluster.

---

## Automatic Pruning

Pruning was enabled through:

```yaml
prune: true
```

When resources were removed from Git, ArgoCD automatically removed them from the Kubernetes cluster.

Example observed during the lab:

```text
Service random-shapes-svc
Status: Pruned
```

---

## Synchronization History

The application performed multiple successful synchronizations:

| Revision |
| -------- |
| 9c3e16e  |
| 16e4e92  |
| 2483af9  |
| 05f2124  |

All revisions finished successfully with:

```text
Status: Synced
Health: Healthy
```

---

## Skills Demonstrated

* ArgoCD Application Management
* GitOps Workflows
* Automated Synchronization
* Self-Healing Applications
* Resource Pruning
* Kubernetes Deployments
* Kubernetes ConfigMaps
* Continuous Reconciliation
* Observability of Application Health

---

## Learning Outcome

This lab provided hands-on experience with ArgoCD's reconciliation engine and demonstrated how GitOps enables automated deployment, drift detection, self-healing, and lifecycle management of Kubernetes resources.
