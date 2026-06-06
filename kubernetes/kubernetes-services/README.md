#  Kubernetes Services

This lab demonstrates how Kubernetes Services provide network access to applications running inside a cluster. The exercise focuses on creating a NodePort Service, exposing application Pods, and verifying connectivity between Kubernetes resources.

## Lab Objectives

* Understand Kubernetes Services
* Create a NodePort Service
* Expose an application running in Pods
* Configure Service selectors
* Map ports between Services and containers
* Verify Service connectivity
* Inspect Service configurations

---

## Technologies Used

* Kubernetes
* kubectl
* Services
* NodePort
* Pods
* Deployments
* YAML

---

## Project Structure

```text
kubernetes-services/
├── README.md
├── service-definition-1.yaml
├── services-output.yaml
└── screenshot/
```

---

## Service Definition

### File

```text
service-definition-1.yaml
```

### Configuration

```yaml
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
  namespace: default

spec:
  type: NodePort

  selector:
    name: simple-webapp

  ports:
    - port: 8080
      targetPort: 8080
      nodePort: 30080
```

---

## Service Information

| Property | Value |
|-----------|---------|
| Service Name | webapp-service |
| Service Type | NodePort |
| Cluster IP | 10.43.98.217 |
| Port | 8080 |
| Target Port | 8080 |
| NodePort | 30080 |
| Selector | name=simple-webapp |

---

## Verify Services

List all Services:

```bash
kubectl get svc
```

Expected output:

```text
NAME             TYPE        CLUSTER-IP     PORT(S)
kubernetes       ClusterIP   10.43.0.1      443/TCP
webapp-service   NodePort    10.43.98.217   8080:30080/TCP
```

Display detailed information:

```bash
kubectl get svc -o wide
```

---

## Verify Deployments

Check the application Deployment:

```bash
kubectl get deployments
```

Expected output:

```text
NAME                       READY   UP-TO-DATE   AVAILABLE
simple-webapp-deployment   4/4     4            4
```

---

## Verify Pods

Display running Pods:

```bash
kubectl get pods -o wide
```

Example:

```text
simple-webapp-deployment-6dcd5bb6b6-js4fb
simple-webapp-deployment-6dcd5bb6b6-nnzsn
simple-webapp-deployment-6dcd5bb6b6-tvpqb
simple-webapp-deployment-6dcd5bb6b6-v59zq
```

All Pods should be in the **Running** state.

---

## Export Service Configuration

Export all Services to YAML:

```bash
kubectl get svc -o yaml > services-output.yaml
```

This file contains:

* Kubernetes default Service
* webapp-service configuration
* Cluster IP information
* NodePort configuration
* Service metadata

---

## Service Architecture

```text
Client
   │
   ▼
NodePort 30080
   │
   ▼
webapp-service
   │
   ▼
Port 8080
   │
   ▼
simple-webapp Pods
(4 Replicas)
```

---

## Learning Outcomes

Through this lab, I learned how to:

* Create Kubernetes Services
* Configure NodePort networking
* Expose applications externally
* Connect Services to Pods using labels
* Verify Service-to-Pod communication
* Inspect Service configuration details
* Understand Kubernetes networking fundamentals

---

## References

* https://kubernetes.io/docs/concepts/services-networking/service/
* https://kubernetes.io/docs/reference/kubectl/
* https://kodekloud.com

---

##  Platform Information

**Platform:** KodeKloud

**Learning Path:** Kubernetes for Beginners

**Lab:** Services

**Topic:** Kubernetes Services, NodePort, Networking and Service-to-Pod Communication
