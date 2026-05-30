# 🚀 Kubernetes Lab: Pods with YAML

## 📖 Overview

This lab focuses on creating and managing Kubernetes Pods using YAML definition files. The objective is to understand the structure of a Pod manifest, define container specifications, and deploy workloads declaratively using Kubernetes.

## 🎯 Objectives

* Understand the basic structure of a Kubernetes Pod YAML manifest.
* Create Pods using YAML definition files.
* Apply Kubernetes resources using `kubectl`.
* Inspect and validate Pod configurations.
* Troubleshoot common configuration issues.

---

## 📂 Project Structure

```text
pods-with-yaml/
├── screenshot/
├── README.md
└── pod-status.yaml
└── pods.yaml
└── redis-definition.yaml

```

---

## 📄 Pod Definition

### redis-definition.yaml

Initial Pod definition used during the lab:

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: redis
  name: redis
spec:
  containers:
  - image: redis123
    name: redis
```

---

## 🛠️ Troubleshooting: Invalid Container Image

During the lab, the Pod definition contained an incorrect container image:

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: redis
  name: redis
spec:
  containers:
  - image: redis123
    name: redis
```

When the Pod was created, Kubernetes was unable to pull the image because `redis123` does not exist in the container registry. This caused the Pod to enter an error state.

To diagnose the issue, the following command was used:

```bash
kubectl describe pod redis
```

The output indicated an image pull failure.

### ✅ Solution

The image name was corrected to the official Redis image:

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: redis
  name: redis
spec:
  containers:
  - image: redis
    name: redis
```

The Pod was then recreated successfully:

```bash
kubectl delete pod redis

kubectl apply -f redis-definition.yaml
```

Verification:

```bash
kubectl get pods
```

Expected result:

```text
NAME    READY   STATUS    RESTARTS   AGE
redis   1/1     Running   0          XXs
```

### 🎯 Lesson Learned

One of the most common causes of Pod deployment failures is an invalid or unavailable container image. Using `kubectl describe pod` helps identify image pull errors and other runtime issues quickly. Correcting the image reference allowed the Pod to start successfully and reach the `Running` state.

---

## ⚙️ Deploying the Pod

Create the Pod from the YAML definition file:

```bash
kubectl apply -f redis-definition.yaml
```

Verify the Pod status:

```bash
kubectl get pods
```

Describe the Pod:

```bash
kubectl describe pod redis
```

---

## 🔍 Validation

Check the Pod details:

```bash
kubectl get pod redis -o wide
```

View the complete Pod manifest:

```bash
kubectl get pod redis -o yaml
```

---

## 🧪 Skills Practiced

* Kubernetes Pod creation
* YAML syntax and structure
* Declarative resource management
* Resource inspection using kubectl
* Basic troubleshooting of Pod configurations
* Diagnosing image pull errors
* Kubernetes debugging techniques

---

## 📚 Key Concepts Learned

### API Version

Defines the Kubernetes API version used by the resource.

```yaml
apiVersion: v1
```

### Kind

Specifies the type of Kubernetes resource.

```yaml
kind: Pod
```

### Metadata

Contains information used to identify the resource.

```yaml
metadata:
  name: redis
```

### Spec

Defines the desired state of the Pod.

```yaml
spec:
  containers:
```

### Container Image

Specifies the container image that Kubernetes should run.

```yaml
image: redis
```

---
## 🎓 Learning Outcome

By completing this lab, I gained hands-on experience creating and managing Kubernetes Pods using YAML manifests. I learned how Kubernetes resources are defined declaratively, how to deploy them using kubectl, and how to inspect and troubleshoot Pod configurations in a Kubernetes cluster. Additionally, I practiced diagnosing and resolving container image issues, an essential skill for Kubernetes administration and DevOps workflows.

---

## 📚 Commands Used

```bash
kubectl apply -f redis-definition.yaml

kubectl get pods

kubectl describe pod redis

kubectl get pod redis -o wide

kubectl get pod redis -o yaml

kubectl delete pod redis
```

---

**Platform:** KodeKloud

**Learning Path:** Kubernetes for Beginners

**Lab:** Pods with YAML

**Focus Areas:** Pods, YAML Manifests, kubectl, Troubleshooting, Container Images, Kubernetes Fundamentals
