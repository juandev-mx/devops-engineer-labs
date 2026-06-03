# Helm Upgrade and Rollback Lab

## Course

**Helm for Beginners**

## Lab

**Lab: upgrading a helm chart**

## Overview

This lab demonstrates how to manage application lifecycle operations using Helm, including chart upgrades, release history inspection, and rollback procedures.

## Technologies

* Helm 3
* Kubernetes
* Bitnami NGINX Chart

## Objectives

* Install an application using Helm
* Upgrade a release to newer chart versions
* Review release history
* Roll back to a previous revision
* Verify deployment status

## Repository Structure

```text
helm-upgrade-chart/
├── README.md
├── commands.sh
├── outputs/
└── screenshots/
```

## Install Initial Release

```bash
helm install dazzling-web bitnami/nginx --version 12.0.4
```

## Upgrade Release

```bash
helm upgrade dazzling-web bitnami/nginx --version 12.0.5
```

Later the release was upgraded again:

```bash
helm upgrade dazzling-web bitnami/nginx --version 18.3.6
```

## Review Release History

```bash
helm history dazzling-web
```

Example revisions:

| Revision | Chart Version | Description      |
| -------- | ------------- | ---------------- |
| 1        | nginx-12.0.4  | Install complete |
| 2        | nginx-12.0.5  | Upgrade complete |
| 3        | nginx-12.0.4  | Upgrade complete |
| 4        | nginx-18.3.6  | Upgrade complete |
| 5        | nginx-12.0.4  | Rollback to 3    |

## Rollback

```bash
helm rollback dazzling-web 3
```

## Verify Deployment

```bash
helm status dazzling-web
```

## Skills Demonstrated

* Helm package management
* Kubernetes application deployment
* Release versioning
* Change management
* Rollback strategies
* Production deployment operations
