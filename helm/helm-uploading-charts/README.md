# Uploading Charts

## Overview

This lab demonstrates how to package a Helm Chart into a distributable archive that can later be uploaded to a Helm repository or shared with other Kubernetes users.

The objective was to learn how Helm packages application charts into compressed `.tgz` files, making them portable, versioned, and ready for distribution.

During this lab, the `webapp-color` chart was packaged successfully, generating a versioned Helm package.

---

## Course Information

**Course:** Helm for Beginners  
**Platform:** KodeKloud

**Lab:** Uploading Charts

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
helm-uploading-charts/
├── README.md
├── commands.sh
├── webapp-color-0.1.0.tgz
└── screenshot/
```

---

## Source Helm Chart

The chart used during this lab was:

```text
webapp-color/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    ├── serviceaccount.yaml
    ├── configmap.yaml
    └── _helpers.tpl
```

---

## Chart Metadata

The chart metadata was defined in:

```yaml
apiVersion: v2
name: webapp-color
description: A Helm chart for Webapp Color Application
type: application
version: 0.1.0
appVersion: "v1"
```

---

## Commands Executed

### Create Package Directory

```bash
mkdir /root/package
```

### Navigate to Package Directory

```bash
cd /root/package/
```

### Package the Helm Chart

```bash
helm package /root/webapp-color
```

---

## Generated Artifact

After packaging the chart, Helm generated the following file:

```text
webapp-color-0.1.0.tgz
```

Example output:

```text
Successfully packaged chart and saved it to:
/root/package/webapp-color-0.1.0.tgz
```

---

## Verify Package Contents

To inspect the packaged chart:

```bash
tar -tzf webapp-color-0.1.0.tgz
```

Example output:

```text
webapp-color/Chart.yaml
webapp-color/values.yaml
webapp-color/templates/deployment.yaml
webapp-color/templates/service.yaml
webapp-color/templates/configmap.yaml
webapp-color/templates/serviceaccount.yaml
webapp-color/templates/_helpers.tpl
```

---

## Display Chart Metadata

To view chart information without extracting the package:

```bash
helm show chart webapp-color-0.1.0.tgz
```

---

## Learning Outcomes

Through this lab, I gained practical experience with:

* Helm chart packaging
* Chart versioning
* Distribution-ready chart creation
* Helm package management
* Validation of packaged Helm charts
* Preparing charts for repository publication

---

## Key Concepts Learned

### Helm Package

A Helm package is a compressed archive (`.tgz`) containing all files required to deploy an application using Helm.

### Chart Versioning

Helm uses the version defined in `Chart.yaml` to generate uniquely versioned package files.

### Chart Distribution

Packaged charts can be uploaded to Helm repositories, artifact registries, or shared directly with development teams.

### Reusability

Packaging enables the same chart to be deployed consistently across multiple Kubernetes environments.

---


## References

Helm Documentation

https://helm.sh/docs/

Kubernetes Documentation

https://kubernetes.io/docs/

---
