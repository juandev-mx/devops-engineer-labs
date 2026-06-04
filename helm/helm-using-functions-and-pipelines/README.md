# Using Functions and Pipelines

## Overview

This lab demonstrates how Helm Functions and Pipelines can be used to create reusable, dynamic, and maintainable Kubernetes manifests.

The lab focuses on using built-in Helm template functions such as `include`, `default`, and `nindent`, together with pipelines (`|`) to process values and render Kubernetes resources dynamically.

A custom Helm Chart named **webapp** was created to deploy an Apache HTTP Server application on Kubernetes.

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
helm-using-functions-and-pipelines/
├── Chart.yaml
├── values.yaml
├── templates/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── serviceaccount.yaml
│   ├── _helpers.tpl
│   └── NOTES.txt
└── README.md
```

---

## Chart Metadata

### Chart.yaml

```yaml
apiVersion: v2
appVersion: 2.4-alpine
description: An Apache Application
name: webapp
type: application
version: 0.1.0
```

This file defines the Helm Chart metadata, including chart version, application version, and description.

---

## Configuration Values

### values.yaml

```yaml
replicaCount: 1

image:
  repository: httpd
  pullPolicy: IfNotPresent
  tag: 2.4.51

nameOverride: webapp
fullnameOverride: my-webapp

serviceAccount:
  create: true
  annotations: {}
  name: webapp-sa
  labels:
    app: web_application
    tier: frontend

service:
  type: NodePort
  port: 80
  nodePort: 30080
```

The `values.yaml` file centralizes configurable parameters used by Helm templates.

---

## Deployment Template

### templates/deployment.yaml

The Deployment template uses several Helm functions and pipelines.

Examples:

```yaml
name: {{ include "webapp.fullname" . }}
```

Uses the `include` function to reuse helper template definitions.

```yaml
labels:
  {{- include "webapp.labels" . | nindent 4 }}
```

Uses a pipeline (`|`) to pass the output of `include` into `nindent`, generating correctly formatted YAML.

```yaml
image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default 2.4 }}"
```

Uses the `default` function to provide a fallback image tag if no value is supplied.

```yaml
serviceAccountName: {{ include "webapp.serviceAccountName" . }}
```

Dynamically resolves the ServiceAccount name through helper templates.

---

## Service Template

### templates/service.yaml

The Service definition also uses helper functions and pipelines.

```yaml
metadata:
  name: {{ include "webapp.fullname" . }}
```

```yaml
labels:
  {{- include "webapp.labels" . | nindent 4 }}
```

```yaml
selector:
  {{- include "webapp.selectorLabels" . | nindent 4 }}
```

These functions improve reusability and reduce duplicated YAML definitions.

---

## Helm Functions Used

### include

Imports and renders another template.

Example:

```yaml
{{ include "webapp.fullname" . }}
```

---

### default

Provides a default value when none is supplied.

Example:

```yaml
{{ .Values.image.tag | default 2.4 }}
```

---

### nindent

Adds indentation while preserving line formatting.

Example:

```yaml
{{ include "webapp.labels" . | nindent 4 }}
```

---

### Pipelines

Pipelines pass the output of one function into another.

Example:

```yaml
{{ include "webapp.labels" . | nindent 4 }}
```

The output of `include` becomes the input of `nindent`.

---

## Commands Executed

### Validate Chart

```bash
helm lint .
```

---

### Render Templates

```bash
helm template .
```

---

### Install Chart

```bash
helm install webapp .
```

---

### List Releases

```bash
helm list
```

---

### Upgrade Release

```bash
helm upgrade webapp .
```

---

### Uninstall Release

```bash
helm uninstall webapp
```

---

## Learning Outcomes

Through this lab, I gained practical experience with:

* Helm template functions
* Helm pipelines
* Reusable template definitions
* Dynamic Kubernetes manifests
* Parameterized deployments
* ServiceAccount configuration
* Helm Chart customization
* YAML formatting using template helpers

---

## Key Concepts Learned

### Functions

Functions transform data inside Helm templates and simplify manifest generation.

### Pipelines

Pipelines chain multiple functions together, improving readability and flexibility.

### Helper Templates

Helper templates defined in `_helpers.tpl` allow reuse of common labels, names, and selectors across Kubernetes resources.

### Parameterization

Configuration values are stored in `values.yaml`, enabling reusable and customizable deployments.

---

## References

* Helm Documentation: https://helm.sh/docs/
* Template Functions: https://helm.sh/docs/chart_template_guide/functions_and_pipelines/
* Kubernetes Documentation: https://kubernetes.io/docs/

---
```
```
