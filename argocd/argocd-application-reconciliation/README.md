# ArgoCD Application Reconciliation

## Overview

This lab demonstrates how ArgoCD continuously monitors a Git repository and reconciles the Kubernetes cluster state with the desired state stored in Git.

The objective was to understand the reconciliation process, application synchronization, deployment tracking, resource monitoring, and revision management using ArgoCD.

During the lab, an ArgoCD Application named **git-webhook-app** was configured to deploy resources from a Git repository into a Kubernetes cluster.

---

## Technologies Used

* ArgoCD
* Kubernetes
* GitOps
* Git
* YAML
* KodeKloud Labs

---

## Repository Structure

```text
argocd-application-reconciliation/
├── README.md
├── application.yaml
├── outputs/
│   ├── app-get.txt
│   ├── app-history.txt
│   ├── app-list.txt
│   └── app-resources.txt
└── screenshots/
```

---

## Application Configuration

### Application Resource

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: git-webhook-app
  namespace: argocd

spec:
  destination:
    namespace: webhook
    server: https://kubernetes.default.svc

  project: default

  source:
    path: ./nginx-app
    repoURL: https://3000-port-47rwrons2xg3pkqq.labs.kodekloud.com/bob/gitops-argocd
    targetRevision: HEAD

  syncPolicy:
    syncOptions:
      - CreateNamespace=true
```

---

## Application Details

Application Name:

```text
git-webhook-app
```

Project:

```text
default
```

Destination Namespace:

```text
webhook
```

Cluster:

```text
https://kubernetes.default.svc
```

Repository:

```text
https://3000-port-47rwrons2xg3pkqq.labs.kodekloud.com/bob/gitops-argocd
```

Repository Path:

```text
./nginx-app
```

Target Revision:

```text
HEAD
```

Sync Policy:

```text
Manual
```

Application Status:

```text
Synced
```

Health Status:

```text
Healthy
```

---

## Resources Managed by ArgoCD

The application deployed and managed the following Kubernetes resources:

| Resource Type | Name          | Namespace | Status |
| ------------- | ------------- | --------- | ------ |
| Service       | nginx-service | webhook   | Synced |
| Deployment    | nginx         | webhook   | Synced |

Output:

```text
GROUP  KIND        NAMESPACE  NAME           STATUS  HEALTH
       Service     webhook    nginx-service  Synced  Healthy
apps   Deployment  webhook    nginx          Synced  Healthy
```

---

## Reconciliation Process

ArgoCD continuously compares:

```text
Desired State (Git Repository)
```

against

```text
Actual State (Kubernetes Cluster)
```

Whenever a difference is detected, ArgoCD identifies the drift and can synchronize the application to restore the desired state.

In this lab, the application successfully reconciled the cluster after a new Git revision was detected.

---

## Synchronization History

The application recorded multiple synchronization events.

```text
SOURCE
https://3000-port-47rwrons2xg3pkqq.labs.kodekloud.com/bob/gitops-argocd

ID      DATE                           REVISION
0       2026-06-05 03:00:50 UTC        567d802
1       2026-06-05 03:02:43 UTC        6c173d6
```

This demonstrates how ArgoCD tracks deployment history and associates each synchronization with a Git commit revision.

---

## Commands Executed

### List Applications

```bash
argocd app list
```

---

### Get Application Details

```bash
argocd app get git-webhook-app
```

---

### View Managed Resources

```bash
argocd app resources git-webhook-app
```

---

### View Synchronization History

```bash
argocd app history git-webhook-app
```

---

### Export Application Manifest

```bash
kubectl get application git-webhook-app \
-n argocd -o yaml
```

---

## Learning Outcomes

Through this lab, I gained practical experience with:

* GitOps workflow using ArgoCD
* Application reconciliation concepts
* Tracking Git revisions and deployments
* Monitoring application health
* Managing Kubernetes resources through Git
* Application synchronization and drift detection
* ArgoCD CLI operations
* ArgoCD Application CRD management

---

## Key Concepts Learned

### Reconciliation

The reconciliation loop continuously compares the desired state stored in Git with the actual state running in Kubernetes.

---

### Synchronization

Synchronization applies changes from the Git repository to the Kubernetes cluster.

---

### Desired State

The desired configuration stored inside the Git repository.

---

### Drift Detection

ArgoCD identifies differences between the Git repository and the running cluster configuration.

---

### GitOps

Git serves as the single source of truth for application deployments and infrastructure configuration.

---

## Evidence

Store screenshots and command outputs in:

```text
screenshots/
```

Examples:

```text
screenshots/
├── argocd-app-list.png
├── argocd-app-get.png
├── argocd-app-history.png
├── argocd-app-resources.png
└── argocd-sync-status.png
```

---

## References

* ArgoCD Documentation: https://argo-cd.readthedocs.io
* Kubernetes Documentation: https://kubernetes.io/docs/

---

GitHub: https://github.com/juandev-mx
