# ArgoCD User Management and RBAC

## Overview

This lab demonstrates how to manage users and configure Role-Based Access Control (RBAC) in ArgoCD.

The objective was to create and manage users, define custom roles, configure permissions, and validate access control policies within an ArgoCD environment running on Kubernetes.

Through this exercise, I gained hands-on experience implementing GitOps security practices and controlling user access to ArgoCD resources.

---

## Technologies Used

* ArgoCD
* Kubernetes
* GitOps
* YAML
* RBAC (Role-Based Access Control)
* ConfigMaps
* Kubectl
* ArgoCD CLI

---

## Lab Objectives

* Configure local ArgoCD users.
* Create custom RBAC roles.
* Assign permissions to users.
* Restrict access according to least-privilege principles.
* Validate user authorization.
* Manage ArgoCD security through ConfigMaps.

---

## Environment

### Kubernetes Cluster

```bash
Kubernetes
```

### GitOps Platform

```bash
ArgoCD
```

---

## User Configuration

ArgoCD user accounts were managed through the `argocd-cm` ConfigMap.

Example:

```yaml
data:
  accounts.alice: login
```

This configuration enabled the user:

```text
alice
```

within the ArgoCD environment.

---

## RBAC Configuration

Permissions were configured using the `argocd-rbac-cm` ConfigMap.

Example policy:

```yaml
policy.csv: |
  p, role:create-app, applications, create, */*, allow
  g, alice, role:create-app
```

This configuration:

* Created a custom role.
* Allowed application creation.
* Assigned the role to user `alice`.

---

## Verifying Available Accounts

Accounts were validated using:

```bash
argocd account list
```

Expected output:

```text
admin
alice
```

---

## Verifying RBAC Policies

RBAC configuration was validated through:

```bash
kubectl get configmap argocd-rbac-cm -n argocd -o yaml
```

This allowed verification of:

* Custom roles
* Policy definitions
* Group-to-role mappings

---

## Verifying User Configuration

User settings were inspected using:

```bash
kubectl get configmap argocd-cm -n argocd -o yaml
```

This confirmed that the new ArgoCD user had been successfully created and enabled.

---

## Files Included

```text
argocd-user-management-and-rbac/
│
├── README.md
├── argocd-cm.yaml
├── argocd-rbac-cm.yaml
│
├── outputs/
│   ├── accounts-list.txt
│   ├── argocd-cm.txt
│   └── argocd-rbac-cm.txt
│
└── screenshot/
```

---

## Commands Used

### Export ArgoCD User Configuration

```bash
kubectl get configmap argocd-cm \
-n argocd \
-o yaml > argocd-cm.yaml
```

### Export RBAC Configuration

```bash
kubectl get configmap argocd-rbac-cm \
-n argocd \
-o yaml > argocd-rbac-cm.yaml
```

### List ArgoCD Accounts

```bash
argocd account list
```

### Inspect RBAC Policies

```bash
kubectl get configmap argocd-rbac-cm -n argocd -o yaml
```

---

## Skills Demonstrated

* GitOps Security
* ArgoCD Administration
* Kubernetes Access Management
* RBAC Policy Configuration
* User Authorization
* Role Management
* YAML Configuration
* Kubernetes ConfigMaps
* GitOps Best Practices

---

## Key Learning Outcomes

* Learned how ArgoCD manages local users.
* Configured custom RBAC policies.
* Applied least-privilege security principles.
* Assigned roles to specific users.
* Verified permissions through ArgoCD and Kubernetes.
* Improved understanding of GitOps platform administration.

---

## References

* ArgoCD Documentation
* Kubernetes RBAC Documentation
* KodeKloud GitOps with ArgoCD Course
