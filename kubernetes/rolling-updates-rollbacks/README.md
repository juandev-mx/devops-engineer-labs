# 🚀 Kubernetes Rolling Updates and Rollbacks

This lab demonstrates how Kubernetes Deployments handle application updates, version management, and rollback operations. The exercise focuses on performing rolling updates, monitoring rollout status, reviewing deployment revisions, and restoring previous versions when necessary.

## Lab Objectives

* Understand Kubernetes Deployment updates
* Perform rolling updates on running applications
* Monitor deployment rollout status
* Review deployment revision history
* Roll back to previous application versions
* Verify deployment health after updates

---

## Technologies Used

* Kubernetes
* kubectl
* Deployments
* ReplicaSets
* Containers
* Rolling Updates
* Rollbacks

---

## Project Structure

```text
rolling-updates-rollbacks/
├── README.md
├── rolling-updates-output.yaml
├── frontend-deployment.yaml
├── deployment-info.txt
└── screenshot/
```

---

## Deployment Information

### Deployment Name

```text
frontend
```

### Container

```text
simple-webapp
```

### Image

```text
kodekloud/webapp-color:v3
```

### Replicas

```text
4
```

### Deployment Strategy

```text
Recreate
```

---

## Verify Deployment

Display deployment information:

```bash
kubectl get deployments
```

Expected output:

```text
NAME       READY   UP-TO-DATE   AVAILABLE
frontend   4/4     4            4
```

Display detailed deployment information:

```bash
kubectl get deployment -o wide
```

---

## Check Rollout Status

Monitor deployment progress:

```bash
kubectl rollout status deployment/frontend
```

Example:

```text
deployment "frontend" successfully rolled out
```

---

## View Rollout History

Display deployment revisions:

```bash
kubectl rollout history deployment/frontend
```

View a specific revision:

```bash
kubectl rollout history deployment/frontend --revision=2
```

---

## Perform a Rolling Update

Update the application image:

```bash
kubectl set image deployment/frontend \
simple-webapp=kodekloud/webapp-color:v2
```

Verify rollout progress:

```bash
kubectl rollout status deployment/frontend
```

---

## Roll Back a Deployment

Restore the previous revision:

```bash
kubectl rollout undo deployment/frontend
```

Verify deployment status:

```bash
kubectl get deployments
kubectl get pods
```

---

## Export Deployment Configuration

Export deployment configuration to YAML:

```bash
kubectl get deployment -o yaml > rolling-updates-output.yaml
```

---

## Deployment Summary

| Property   | Value                     |
| ---------- | ------------------------- |
| Deployment | frontend                  |
| Replicas   | 4                         |
| Container  | simple-webapp             |
| Image      | kodekloud/webapp-color:v3 |
| Strategy   | Recreate                  |
| Port       | 8080                      |

---

## Learning Outcomes

Through this lab, I learned how to:

* Manage Kubernetes Deployments
* Perform application updates safely
* Monitor rollout execution
* Inspect deployment revisions
* Roll back failed updates
* Verify deployment availability
* Understand deployment lifecycle management

---

## Screenshots

Store screenshots in the following directory:

```text
screenshot/
```

Suggested screenshots:

* Initial deployment
* Deployment rollout status
* Deployment revision history
* Updated application version
* Rollback execution
* Final deployment state

---

## References

- https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
- https://kubernetes.io/docs/reference/kubectl/
- https://kodekloud.com

---

## 📚 Platform Information

**Platform:** KodeKloud

**Learning Path:** Kubernetes for Beginners

**Lab:** Practice Test - Rolling Updates and Rollbacks

**Topic:** Kubernetes Deployments, Rolling Updates, Rollout History and Rollbacks
