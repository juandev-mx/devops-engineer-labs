# Bonus Lecture: Labs - YAML

## 📘 Overview

This lab focuses on learning the fundamentals of YAML syntax and configuration files commonly used in DevOps environments.

During this exercise, YAML structures and formatting rules were practiced to better understand how modern infrastructure and automation tools use declarative configuration files.

YAML is widely used in technologies such as:

* Docker Compose
* Kubernetes
* Ansible
* GitHub Actions
* Tekton Pipelines
* ArgoCD
* CI/CD workflows

---

## 🎯 Objectives

* Understand YAML syntax
* Learn indentation rules
* Create key-value structures
* Work with lists and nested objects
* Practice configuration file formatting
* Understand YAML usage in DevOps tools

---


## 📂 Project Structure

```bash
YAML/
├── README.md
├── practice.yaml
└── .gitkeep
```

---

## 📄 YAML Syntax Basics

### Key-Value Pairs

```yaml
name: Juan
role: DevOps Engineer
```

---

### Lists

```yaml
tools:
  - Docker
  - Kubernetes
  - Jenkins
```

---

### Nested Configuration

```yaml
application:
  name: ecommerce-app
  version: 1.0
```

---

## 🐳 Docker Compose YAML Example

Example of a simple Docker Compose configuration:

```yaml
version: '3'

services:
  web:
    image: nginx
    ports:
      - "80:80"
```

---

## ▶️ Commands Used

### Verify YAML File

```bash
cat practice.yaml
```

### Validate Docker Compose File

```bash
docker compose config
```

### Search YAML Files

```bash
find ~ \( -name "*.yml" -o -name "*.yaml" \)
```

### Copy Practice File

```bash
cp /home/bob/playbooks/practice.yaml ~/devops-engineer-labs/docker/YAML/
```

---

## 📚 Concepts Learned

* YAML indentation rules
* Declarative configuration
* Lists and dictionaries
* Nested structures
* Docker Compose syntax
* Configuration management
* Infrastructure as Code (IaC) concepts

---

## 🚀 DevOps Importance

YAML is one of the most important configuration languages in modern DevOps practices because it enables infrastructure, pipelines, deployments, and services to be defined in a simple and readable format.

This knowledge is essential for working with:

* Kubernetes manifests
* Docker Compose applications
* CI/CD pipelines
* Cloud-native applications
* Infrastructure automation

---

## 📌 Notes

This lab was completed as part of the KodeKloud Docker & DevOps learning path and documented inside the `devops-engineer-labs` repository.

GitHub Repository:

```bash
https://github.com/juandev-mx/devops-engineer-labs
```

---

## 👨‍💻 Author

**Juan Carlos Reynoso Zuñiga**

* Backend Developer
* DevOps Learner
* API & Integration Engineer Enthusiast

GitHub:

```bash
https://github.com/juandev-mx
```
