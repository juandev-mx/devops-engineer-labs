# Helm Deploy Chart

## Course

**Helm for Beginners**

## Lab

**Lab: Using Helm to Deploy a Chart**

## Objective

Learn how to deploy existing Helm charts from a repository and manage releases inside a Kubernetes cluster.

---

## Project Structure

```text
helm-deploy-chart/
│
├── README.md
├── screenshot/
├── commands/
│   ├── deploy-chart.sh

```

---

## Technologies

- Helm 3
- Kubernetes
- Bitnami Charts
- Apache
- NGINX

## Charts Deployed

| Release | Chart | Version |
|----------|----------|----------|
| amaze-surf | Apache | 11.3.2 |
| crazy-web | NGINX | 19.0.0 |

## Commands Used

### Add Bitnami Repository

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

### Search Available Charts

```bash
helm search repo
```

### Deploy Apache Chart

```bash
helm install amaze-surf bitnami/apache
```

### Deploy NGINX Chart

```bash
helm install crazy-web bitnami/nginx
```

### Verify Installed Releases

```bash
helm list -A
```

### View Release Status

```bash
helm status amaze-surf
helm status crazy-web
```

### View Generated Kubernetes Resources

```bash
helm get manifest amaze-surf
helm get manifest crazy-web
```

## Learning Outcomes

- Working with Helm repositories
- Installing Helm charts
- Managing Helm releases
- Inspecting generated Kubernetes manifests
- Understanding Helm release lifecycle management
