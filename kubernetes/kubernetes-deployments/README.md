#  Kubernetes Lab: Deployments

##  Overview

This lab focuses on creating and managing Kubernetes Deployments using YAML definition files. The objective is to understand how Deployments provide declarative updates for Pods and ReplicaSets, enabling scalable and self-healing applications in a Kubernetes cluster.

During the lab, Deployments were created using YAML manifests, verified using kubectl commands, and troubleshooted by correcting container image configuration issues.

---

##  Objectives

- Understand the structure of a Kubernetes Deployment manifest.
- Create Deployments using YAML definition files.
- Manage application replicas declaratively.
- Verify Deployment status and Pod availability.
- Inspect Deployment resources using kubectl.
- Troubleshoot Deployment configuration issues.
- Understand the relationship between Deployments, ReplicaSets, and Pods.

---

## ️ Technologies Used

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white)
![Kubectl](https://img.shields.io/badge/kubectl-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

---

##  Project Structure

```text
deployments/
├── README.md
├── deployment-definition-1.yaml
├── deployment-definition-httpd.yaml
├── deployments-output.yaml
└── screenshot/
```

---

##  Deployment Definitions

### deployment-definition-1.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-1
spec:
  replicas: 2
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
        - "-c"
        - echo Hello Kubernetes! && sleep 3600
```

---

### deployment-definition-httpd.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-frontend
  labels:
    type: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      name: httpd-frontend
  template:
    metadata:
      labels:
        name: httpd-frontend
    spec:
      containers:
      - name: httpd-container
        image: httpd:2.4-alpine
        ports:
        - containerPort: 80
```

---

## ️ Creating Deployments

Create the Deployments using the YAML manifests:

```bash
kubectl apply -f deployment-definition-1.yaml
```

```bash
kubectl apply -f deployment-definition-httpd.yaml
```

Verify the Deployments:

```bash
kubectl get deployments
```

Expected output:

```text
NAME                READY   UP-TO-DATE   AVAILABLE
deployment-1        2/2     2            2
httpd-frontend      3/3     3            3
```

---

##  Deployment Inspection

List Deployments:

```bash
kubectl get deployments
```

Display detailed information:

```bash
kubectl describe deployment deployment-1
```

```bash
kubectl describe deployment httpd-frontend
```

View all Deployment definitions:

```bash
kubectl get deployment -o yaml
```

Export Deployment configuration:

```bash
kubectl get deployment -o yaml > deployments-output.yaml
```

---

##  Troubleshooting Deployment Issues

One of the tasks in the lab involved troubleshooting a Deployment that was unable to start successfully.

The Deployment contained an invalid container image:

```yaml
image: busybox888
```

Because the image did not exist in the container registry, Pods entered an ImagePullBackOff state.

Incorrect configuration:

```yaml
containers:
- name: busybox-container
  image: busybox888
```

Correct configuration:

```yaml
containers:
- name: busybox-container
  image: busybox
```

After updating the image and applying the changes, the Deployment successfully created all replicas.

Apply the corrected configuration:

```bash
kubectl apply -f deployment-definition-1.yaml
```

Verify Deployment status:

```bash
kubectl get deployments
```

Verify Pods:

```bash
kubectl get pods
```

---

##  Skills Practiced

- Kubernetes Deployments
- Deployment YAML manifests
- Replica management
- Rolling updates
- Resource inspection
- Kubernetes troubleshooting
- Pod lifecycle management
- Declarative infrastructure management

---

##  Key Concepts Learned

### Deployment

A Deployment manages ReplicaSets and Pods, providing declarative updates and self-healing capabilities.

```yaml
kind: Deployment
```

---

### Replicas

Defines how many Pod instances should run.

```yaml
spec:
  replicas: 3
```

---

### Selector

Defines how the Deployment identifies the Pods it manages.

```yaml
selector:
  matchLabels:
```

---

### Pod Template

Specifies the Pod configuration used to create replicas.

```yaml
template:
```

---

### Container Image

Defines which container image Kubernetes should run.

```yaml
image: httpd:2.4-alpine
```

---

##  Validation Commands

Check Deployments:

```bash
kubectl get deployments
```

Check ReplicaSets:

```bash
kubectl get replicasets
```

Check Pods:

```bash
kubectl get pods
```

View detailed Deployment information:

```bash
kubectl describe deployment deployment-1
```

```bash
kubectl describe deployment httpd-frontend
```

---

##  Learning Outcome

By completing this lab, I gained practical experience creating and managing Kubernetes Deployments using YAML manifests. I learned how Deployments automate the management of ReplicaSets and Pods, how to scale applications declaratively, and how to troubleshoot common deployment issues such as invalid container images. Additionally, I practiced inspecting Kubernetes resources and validating application availability within a cluster.

---

##  Platform Information

**Platform:** KodeKloud

**Learning Path:** Kubernetes for Beginners

**Lab:** Deployments

**Topic:** Kubernetes Deployments, ReplicaSets and Pod Management
