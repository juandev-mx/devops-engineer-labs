# Conditionals, With Blocks and Ranges

## Overview

This lab demonstrates how to use Helm template control structures to create dynamic and reusable Kubernetes manifests.

The main objective was to learn how to implement:

* Conditional statements (`if`)
* Context blocks (`with`)
* Iteration (`range`)

These features allow Helm Charts to generate Kubernetes resources dynamically based on values defined in `values.yaml`.

The lab uses a custom chart named **webapp-color** that deploys a web application and configures Services, ConfigMaps, and ServiceAccounts through Helm templates.

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
helm-conditionals-with-blocks-and-ranges/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    ├── configmap.yaml
    └── serviceaccount.yaml
```

---

## Chart Metadata

### Chart.yaml

```yaml
apiVersion: v2
name: webapp-color
description: A Helm chart for Webapp Color Application
type: application
version: 0.1.0
appVersion: "v1"
```

---

## Configuration Values

### values.yaml

Important values used during the lab:

```yaml
service:
  type: NodePort
  port: 8080
  nodePort: 30080
```

```yaml
serviceAccount:
  create: true
  name: webapp-sa
```

```yaml
serviceAccount:
  labels:
    tier: frontend
    type: web
    mode: proxy
```

---

## Conditional Statements

The Service template uses an `if` statement:

```yaml
{{- if eq .Values.service.type "NodePort" }}
nodePort: {{ .Values.service.nodePort }}
{{- end }}
```

This ensures that the `nodePort` field is only rendered when the service type is configured as `NodePort`.

---

## ConfigMap and Conditional Logic

The ConfigMap template uses conditional statements to dynamically assign application configuration values based on the selected environment.

### templates/configmap.yaml

```yaml
apiVersion: v1
metadata:
  name: {{ .Values.configMap.name }}
  namespace: default
kind: ConfigMap
data:
  {{- if eq .Values.environment "production" }}
    APP_COLOR: pink
  {{- else if eq .Values.environment "development" }}
    APP_COLOR: darkblue
  {{- else }}
    APP_COLOR: green
  {{- end }}
```

The value of `APP_COLOR` changes according to the environment configured in `values.yaml`.

### Development Environment

```yaml
environment: development
```

Generated output:

```yaml
APP_COLOR: darkblue
```

### Production Environment

```yaml
environment: production
```

Generated output:

```yaml
APP_COLOR: pink
```

### Any Other Environment

```yaml
environment: testing
```

Generated output:

```yaml
APP_COLOR: green
```

This demonstrates how Helm conditionals can dynamically generate Kubernetes manifests based on deployment configuration.

## With Blocks

The ServiceAccount template uses a `with` block:

```yaml
{{- with .Values.serviceAccount.create }}
```

The template is rendered only when ServiceAccount creation is enabled.

---

## Range Loops

The ServiceAccount template dynamically iterates through labels:

```yaml
{{- range $key, $val := $.Values.serviceAccount.labels }}
{{ $key }}: {{ $val }}
{{- end }}
```

Using the values:

```yaml
labels:
  tier: frontend
  type: web
  mode: proxy
```

Helm generates:

```yaml
tier: frontend
type: web
mode: proxy
```

This approach improves maintainability and scalability.

---

## Deployment Template

The Deployment references a ConfigMap dynamically:

```yaml
envFrom:
  - configMapRef:
      name: {{ .Values.configMap.name }}
```

This allows environment configuration to be managed externally.

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
helm install webapp-color .
```

### Upgrade Chart

```bash
helm upgrade webapp-color .
```

### List Releases

```bash
helm list
```

### Uninstall Chart

```bash
helm uninstall webapp-color
```

---

## Learning Outcomes

Through this lab, I gained practical experience with:

* Helm conditional logic
* Dynamic resource generation
* Context management using with blocks
* Iteration using range loops
* Configurable Kubernetes manifests
* ServiceAccount customization
* Helm template best practices

---

## Key Concepts Learned

### if

Conditionally renders template sections.

### with

Simplifies access to nested values and controls rendering.

### range

Iterates through collections such as lists and maps.

### Dynamic Templates

Helm templates can generate Kubernetes manifests based on runtime configuration values.

---

## References

* Helm Documentation: https://helm.sh/docs/
* Helm Flow Control: https://helm.sh/docs/chart_template_guide/control_structures/
* Kubernetes Documentation: https://kubernetes.io/docs/

---
