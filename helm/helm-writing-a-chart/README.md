# Writing a Helm Chart

## Overview

This lab demonstrates how to create and customize Helm Charts for Kubernetes applications.

The objective was to understand the core structure of a Helm Chart, including chart metadata, configuration values, template rendering, and Kubernetes resource definitions.

During the lab, two Helm Charts were created:

* hello-world
* webapp-nginx

These charts package Kubernetes resources and use Helm templating to provide reusable and configurable deployments.

---

## Course Information

**Course:** Helm for Beginners  
**Platform:** KodeKloud

**Lab:** Writing a Helm Chart

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
helm-writing-a-chart/
├──  README.md
├── hello-world/
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── README.md
│   ├── .helmignore
│   └── templates/
│       ├── deployment.yaml
│       └── service.yaml
│
├── webapp-nginx/
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── .helmignore
│   └── templates/
│       ├── deployment.yaml
│       └── service.yaml
```

---

## Helm Chart Components

### Chart.yaml

The `Chart.yaml` file defines the metadata of a Helm Chart.

Content used in the `hello-world` chart:

```yaml
apiVersion: v2
appVersion: 1.16.0
description: A Helm chart for Kubernetes
name: hello-world
type: application
version: 0.1.0
```

Key fields:

| Field       | Description            |
| ----------- | ---------------------- |
| apiVersion  | Helm chart API version |
| name        | Chart name             |
| description | Chart description      |
| type        | Application chart type |
| version     | Chart version          |
| appVersion  | Application version    |

---

### values.yaml

The `values.yaml` file contains configurable values consumed by templates.

Content used in the `hello-world` chart:

```yaml
replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: "1.16.0"

nameOverride: ""
fullnameOverride: ""

service:
  type: ClusterIP
  port: 80
```

These values can be modified without changing the Kubernetes templates.

---

### deployment.yaml

The Deployment template creates Kubernetes Deployments dynamically using Helm variables.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-hello-world
  labels:
    app: hello-world
spec:
  replicas: {{ .Values.replicaCount }}
```

Important Helm variables used:

| Variable                 | Description                       |
| ------------------------ | --------------------------------- |
| .Release.Name            | Name assigned during installation |
| .Values.replicaCount     | Number of pod replicas            |
| .Values.image.repository | Container image repository        |
| .Values.image.tag        | Container image version           |
| .Chart.Name              | Chart name                        |

The Deployment deploys an NGINX container and configures health checks through readiness and liveness probes.

---

### service.yaml

The Service template exposes the application inside the Kubernetes cluster.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-hello-world
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
```

The Service configuration is dynamically generated from values stored in `values.yaml`.

---

### webapp-nginx Chart

Metadata:

```yaml
apiVersion: v2
name: webapp-nginx
description: A Helm chart for Kubernetes
type: application
version: 0.1.1
appVersion: "1.16.0"
```

Configuration values:

```yaml
replicaCount: 1

image:
  repository: nginx
  tag: 1.16.0

service:
  type: NodePort
  port: 80
  nodePort: 30080
```

This chart exposes the application externally through a Kubernetes NodePort Service.

---

### .helmignore

The `.helmignore` file specifies files and directories excluded when packaging the chart.

Similar to `.gitignore`, it prevents unnecessary files from being included in chart packages.

---

## Commands Executed

### Create Charts

```bash
helm create hello-world
```

```bash
helm create webapp-nginx
```

---

### Validate Charts

```bash
helm lint hello-world
```

```bash
helm lint webapp-nginx
```

---

### Render Templates

```bash
helm template hello-world
```

```bash
helm template webapp-nginx
```

---

### Install Charts

```bash
helm install hello-world ./hello-world
```

```bash
helm install webapp-nginx ./webapp-nginx
```

---

### List Installed Releases

```bash
helm list
```

---

### Remove Releases

```bash
helm uninstall hello-world
```

```bash
helm uninstall webapp-nginx
```

---

## Learning Outcomes

Through this lab, I gained practical experience with:

* Helm Chart architecture
* Chart metadata management
* Helm templating syntax
* Kubernetes Deployment resources
* Kubernetes Service resources
* Parameterization using values.yaml
* Template rendering and validation
* Helm package lifecycle management
* Application deployment on Kubernetes

---

## Key Concepts Learned

### Helm Chart

A Helm Chart is a package that contains all Kubernetes resource definitions required to deploy an application.

### Templates

Templates use placeholders and variables to dynamically generate Kubernetes manifests.

### Values

The `values.yaml` file centralizes configuration and allows deployments to be customized without modifying templates.

### Release

A release is a deployed instance of a Helm Chart running inside a Kubernetes cluster.

### Parameterization

Helm enables reusable deployments by separating configuration values from Kubernetes manifests.

---

## References

Helm Documentation

https://helm.sh/docs/

Kubernetes Documentation

https://kubernetes.io/docs/

