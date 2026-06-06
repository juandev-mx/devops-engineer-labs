# Manage Secrets using Bitnami Sealed Secrets and HashiCorp Vault

## Overview

This lab explores secure secret management practices in Kubernetes using **Bitnami Sealed Secrets**, **HashiCorp Vault**, and **ArgoCD**.

The objective was to deploy and manage application secrets using GitOps principles while avoiding the exposure of sensitive information in Git repositories. The lab demonstrates how to encrypt Kubernetes Secrets using Sealed Secrets and how to integrate HashiCorp Vault for centralized secret storage and retrieval.

---

## Objectives

* Deploy and configure Bitnami Sealed Secrets.
* Deploy HashiCorp Vault inside Kubernetes.
* Encrypt Kubernetes Secrets before storing them in Git.
* Manage secrets through GitOps workflows using ArgoCD.
* Validate automated synchronization and reconciliation.
* Improve security by preventing plaintext credentials from being stored in repositories.

---

## Architecture

```text
Developer
    │
    ▼
Kubernetes Secret
    │
    ▼
kubeseal
    │
    ▼
SealedSecret
    │
    ▼
Git Repository
    │
    ▼
ArgoCD
    │
    ▼
Kubernetes Cluster
    │
    ▼
Sealed Secrets Controller
    │
    ▼
Kubernetes Secret
```

Additional secret management capabilities were provided using:

```text
HashiCorp Vault
      │
      ▼
Secure Secret Storage
      │
      ▼
Applications
```

---

## Technologies Used

* Kubernetes
* ArgoCD
* GitOps
* Bitnami Sealed Secrets
* HashiCorp Vault
* kubeseal
* YAML
* Git
* Linux

---

## Project Structure

```text
argocd-manage-secrets-using-bitnami-sealed-secrets-and-hashicorp-vault
│
├── README.md
├── application.yaml
│
├── manifests
│   ├── mysql-password_k8s-secret.yaml
│   ├── mysql-password_sealed-secret.yaml
│   ├── secret.yaml
│   ├── secret_updated.yaml
│   └── vault.env
│
├── outputs
│   ├── app-list.txt
│   ├── encrypted-secret-app.txt
│   ├── encrypted-secret-resources.txt
│   ├── sealed-secrets.txt
│   ├── vault-pods.txt
│   └── secrets.txt
│
└── screenshot/
```

---

## Deploying Sealed Secrets

Verify the Sealed Secrets controller deployment:

```bash
kubectl get pods -n kube-system
```

Verify the controller service:

```bash
kubectl get svc -n kube-system
```

Expected component:

```text
sealed-secrets
```

---

## Creating a Kubernetes Secret

Example secret:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysql-password
type: Opaque
stringData:
  password: my-secret-password
```

Apply:

```bash
kubectl apply -f mysql-password_k8s-secret.yaml
```

---

## Encrypting Secrets with kubeseal

Export the controller certificate:

```bash
kubeseal \
  --fetch-cert \
  > sealedSecret-publicCert.crt
```

Generate the encrypted secret:

```bash
kubeseal \
  --cert sealedSecret-publicCert.crt \
  -f mysql-password_k8s-secret.yaml \
  -w mysql-password_sealed-secret.yaml
```

The generated file can safely be stored in Git.

---

## Deploying with ArgoCD

Application configuration:

```yaml
spec:
  source:
    repoURL: <git-repository>
    path: ./sealed-secret
    targetRevision: HEAD
```

Verify application status:

```bash
argocd app list
```

Output:

```text
encrypted-secret
Synced
Healthy
```

---

## 🔄 Automated Synchronization

The application was configured with automated synchronization:

```yaml
syncPolicy:
  automated:
    prune: true
    selfHeal: true
```

Features:

* Automatic deployment
* Automatic reconciliation
* Drift detection
* Self-healing
* Resource pruning

---

## Deploying HashiCorp Vault

Verify Vault deployment:

```bash
kubectl get pods -A | grep vault
```

Expected components:

```text
vault-0
vault-agent-injector
```

Verify services:

```bash
kubectl get svc -A | grep vault
```

Expected services:

```text
vault
vault-ui
vault-agent-injector
```

---

## ArgoCD Applications

### Sealed Secrets Application

```text
Application: sealed-secrets
Status: Synced
Health: Healthy
```

### Encrypted Secret Application

```text
Application: encrypted-secret
Status: Synced
Health: Healthy
```

---

## ✅ Validation

The following validations were completed:

* Sealed Secrets controller deployed successfully.
* Public certificate exported successfully.
* Kubernetes Secret encrypted successfully.
* SealedSecret stored in Git repository.
* ArgoCD synchronized resources automatically.
* Secret recreated successfully inside Kubernetes.
* Vault deployed successfully.
* Vault Agent Injector running correctly.
* GitOps workflow validated end-to-end.

---

## Key Concepts Learned

### Bitnami Sealed Secrets

* Encrypts Kubernetes Secrets.
* Safe for Git repositories.
* Cluster-specific encryption.
* GitOps friendly.

### HashiCorp Vault

* Centralized secret management.
* Dynamic secrets.
* Secure storage.
* Access control and auditing.

### ArgoCD

* Continuous delivery for Kubernetes.
* Automated synchronization.
* Self-healing.
* Declarative GitOps workflows.

---

## Skills Practiced

* Kubernetes Secret Management
* GitOps Workflows
* ArgoCD Administration
* Secret Encryption
* HashiCorp Vault Deployment
* YAML Configuration
* Secure Application Delivery
* DevSecOps Fundamentals

---

## Lab Outcome

Successfully implemented secure secret management in Kubernetes using Bitnami Sealed Secrets and HashiCorp Vault while leveraging ArgoCD GitOps workflows for automated deployment, synchronization, reconciliation, and secure delivery of application secrets.
