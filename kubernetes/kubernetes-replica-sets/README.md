# 🚀 Kubernetes Lab: Replica Sets

## 📖 Overview

This lab focuses on creating, managing, scaling, and troubleshooting Kubernetes ReplicaSets. A ReplicaSet ensures that a specified number of identical Pod replicas are always running within the cluster.

The lab demonstrates how ReplicaSets provide high availability and self-healing capabilities by automatically replacing failed or deleted Pods.

---

## 🎯 Objectives

* Understand the purpose of ReplicaSets in Kubernetes.
* Create ReplicaSets using YAML manifests.
* Deploy ReplicaSets with `kubectl`.
* Verify ReplicaSet and Pod status.
* Troubleshoot deployment issues.
* Scale ReplicaSets to adjust workload capacity.
* Observe Kubernetes self-healing behavior.

---

## 🛠️ Technologies Used

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge\&logo=kubernetes\&logoColor=white)

![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge\&logo=yaml\&logoColor=white)

![Kubectl](https://img.shields.io/badge/kubectl-326CE5?style=for-the-badge\&logo=kubernetes\&logoColor=white)

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge\&logo=linux\&logoColor=black)

---

## 📂 Project Structure

```text
replica-sets/
├── README.md
├── replicaset-definition-1.yaml
├── replicaset-definition-2.yaml
├── new-replica-set.yaml
└── screenshot/
```

---

## 📄 ReplicaSet Definition 1

### replicaset-definition-1.yaml

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-1
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx
```

---

## 📄 ReplicaSet Definition 2

### replicaset-definition-2.yaml

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-2
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: nginx
  template:
    metadata:
      labels:
        tier: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```

---

## 📄 ReplicaSet Definition 3

### new-replica-set.yaml

Final corrected version used during the lab:

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: new-replica-set
spec:
  replicas: 4
  selector:
    matchLabels:
      name: busybox-pod
  template:
    metadata:
      labels:
        name: busybox-pod
    spec:
      containers:
      - name: busybox-container
        image: busybox
        command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
```

---

## 🚀 Deploying ReplicaSets

Create the ReplicaSets:

```bash
kubectl apply -f replicaset-definition-1.yaml
kubectl apply -f replicaset-definition-2.yaml
kubectl apply -f new-replica-set.yaml
```

Verify the ReplicaSets:

```bash
kubectl get rs
```

Example output:

```text
NAME              DESIRED   CURRENT   READY
replicaset-1      2         2         2
replicaset-2      2         2         2
new-replica-set   4         4         4
```

---

## 🔍 Verification

List all Pods:

```bash
kubectl get pods
```

Describe a ReplicaSet:

```bash
kubectl describe rs new-replica-set
```

View the complete ReplicaSet manifest:

```bash
kubectl get rs new-replica-set -o yaml
```

---

## ⚠️ Troubleshooting Exercise

One of the tasks in the lab involved diagnosing Pods that failed to start.

The original ReplicaSet contained an invalid image:

```yaml
image: busybox777
```

Pods entered an error state because Kubernetes could not pull the image.

Example:

```bash
kubectl get pods
```

```text
NAME                         READY   STATUS             RESTARTS
new-replica-set-xxxxx        0/1     ImagePullBackOff   0
```

### Root Cause

The image `busybox777` does not exist in the container registry.

### Solution

Update the ReplicaSet configuration:

```yaml
image: busybox
```

Apply the changes:

```bash
kubectl replace -f new-replica-set.yaml
```

Verify successful deployment:

```bash
kubectl get pods
```

---

## 📈 Scaling ReplicaSets

Increase the number of replicas:

```bash
kubectl scale rs new-replica-set --replicas=5
```

Verify scaling:

```bash
kubectl get rs
```

Example:

```text
NAME              DESIRED   CURRENT   READY
new-replica-set   5         5         5
```

---

## 🔄 Self-Healing Demonstration

ReplicaSets automatically maintain the desired number of Pods.

Delete one Pod:

```bash
kubectl delete pod <pod-name>
```

Watch Kubernetes create a replacement:

```bash
kubectl get pods -w
```

This demonstrates the self-healing capability provided by ReplicaSets.

---

## 🧪 Skills Practiced

* ReplicaSet creation
* Declarative Kubernetes resource management
* YAML manifest development
* Kubernetes troubleshooting
* ReplicaSet scaling
* Pod lifecycle management
* Self-healing validation
* Container image troubleshooting

---

## 📚 Key Concepts Learned

### ReplicaSet

Ensures that a specified number of Pod replicas are running.

```yaml
kind: ReplicaSet
```

### Replicas

Defines the desired number of Pods.

```yaml
replicas: 4
```

### Selector

Determines which Pods belong to the ReplicaSet.

```yaml
selector:
  matchLabels:
```

### Pod Template

Defines the Pod specification used to create replicas.

```yaml
template:
```

### Self-Healing

Automatically recreates Pods when they are deleted or fail.

### Scaling

Allows increasing or decreasing the number of running Pod replicas.

---

## 🎓 Learning Outcome

By completing this lab, I gained hands-on experience working with Kubernetes ReplicaSets and learned how they ensure workload availability through automatic Pod replication and recovery. I practiced creating ReplicaSets from YAML manifests, troubleshooting image-related deployment issues, scaling applications, and validating Kubernetes self-healing capabilities in a real cluster environment.

---

## 📚 Commands Used

```bash
kubectl apply -f replicaset-definition-1.yaml
kubectl apply -f replicaset-definition-2.yaml
kubectl apply -f new-replica-set.yaml

kubectl get rs
kubectl get pods

kubectl describe rs

kubectl scale rs new-replica-set --replicas=5

kubectl delete pod <pod-name>

kubectl get pods -w
```

---

**Platform:** KodeKloud

**Learning Path:** DevOps Engineer

**Course:** Kubernetes for Beginners

**Lab:** Replica Sets
