# Terraform Data Sources Lab

Hands-on lab completed during the KodeKloud Terraform Basics Training Course.

This lab demonstrates how Terraform Data Sources can be used to retrieve information from existing resources and external systems without creating or modifying infrastructure.

---

# Objective

The objective of this lab was to understand:

* Terraform Data Sources
* Reading existing infrastructure
* Querying AWS resources
* Accessing local system information
* Using retrieved data in Terraform configurations
* Infrastructure discovery techniques

---

# Technologies Used

| Category        | Technology     |
| --------------- | -------------- |
| IaC             | Terraform      |
| Language        | HCL            |
| Provider        | Local Provider |
| Provider        | AWS Provider   |
| Platform        | Linux          |
| Cloud           | AWS            |
| Version Control | Git & GitHub   |

---

# Project Structure

```text
datasources/
│
├── main.tf
├── ebs.tf
├── s3.tf
└── README.md
```

---

# What Are Terraform Data Sources?

Data Sources allow Terraform to read information from existing resources without managing or modifying them.

Unlike resources:

```hcl
resource "aws_instance" "server" {
}
```

which create infrastructure,

Data Sources only retrieve information:

```hcl
data "aws_instance" "server" {
}
```

This makes them extremely useful when integrating with infrastructure that already exists.

---

# Lab 1: Reading Local System Information

## File

```hcl
output "os-version" {
  value = data.local_file.os.content
}

data "local_file" "os" {
  filename = "/etc/os-release"
}
```

---

## Purpose

This Data Source reads the Linux operating system information stored in:

```text
/etc/os-release
```

Terraform loads the file contents and exposes them through an output variable.

---

## Output Example

```text
PRETTY_NAME="Ubuntu 24.04 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
```

---

## Learning Outcome

This demonstrates how Terraform can retrieve local system data and expose it for automation workflows.

---

# Lab 2: AWS EBS Volume Data Source

## File

```hcl
data "aws_ebs_volume" "gp2_volume" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp2"]
  }
}
```

---

## Purpose

This Data Source searches AWS for the most recently created EBS volume using the:

```text
gp2
```

volume type.

---

## Query Logic

Terraform filters available EBS volumes using:

```hcl
filter {
  name   = "volume-type"
  values = ["gp2"]
}
```

and returns:

```hcl
most_recent = true
```

to select the latest matching volume.

---

## Real-World Use Cases

* Attaching existing storage volumes
* Infrastructure audits
* Backup automation
* Migration projects
* Resource inventory discovery

---

# Lab 3: AWS S3 Bucket Data Source

## File

```hcl
data "aws_s3_bucket" "selected" {
  bucket = "bucket.test.com"
}
```

---

## Purpose

This Data Source retrieves metadata from an existing S3 bucket.

Terraform does not create the bucket.

Instead, it queries AWS and returns information about:

* Bucket ARN
* Bucket domain name
* Region
* Hosting information
* Other bucket attributes

---

## Real-World Use Cases

* Static website hosting
* Shared storage integrations
* Logging infrastructure
* Remote Terraform state backends
* CI/CD pipelines

---

# Resource vs Data Source

## Resource

Creates and manages infrastructure.

```hcl
resource "aws_s3_bucket" "example" {
}
```

---

## Data Source

Reads existing infrastructure.

```hcl
data "aws_s3_bucket" "example" {
}
```

---

## Comparison

| Feature                       | Resource | Data Source |
| ----------------------------- | -------- | ----------- |
| Creates Infrastructure        | Yes      | No          |
| Modifies Infrastructure       | Yes      | No          |
| Reads Existing Infrastructure | No       | Yes         |
| Used for Discovery            | No       | Yes         |
| Used for Automation           | Yes      | Yes         |

---

# Terraform Workflow

Initialize providers:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Preview execution:

```bash
terraform plan
```

Retrieve data:

```bash
terraform apply
```

Display outputs:

```bash
terraform output
```

---

# Skills Demonstrated

* Infrastructure as Code (IaC)
* Terraform fundamentals
* Terraform Data Sources
* AWS resource discovery
* AWS EBS integration
* AWS S3 integration
* Local file data retrieval
* Infrastructure inventory management
* Cloud automation
* DevOps best practices

---

# Key Concepts Learned

## Infrastructure Discovery

Terraform can query infrastructure that already exists.

This is essential when working with:

* Legacy environments
* Shared cloud accounts
* Existing production systems

---

## Dynamic Configuration

Data Sources allow Terraform configurations to adapt dynamically based on existing resources.

Instead of hardcoding values, Terraform can retrieve them automatically.

---

## Cloud Resource Integration

Using Data Sources makes it possible to connect new infrastructure with:

* Existing storage
* Existing databases
* Existing networking resources
* Existing cloud services

---

# Learning Outcome

This lab provided practical experience using Terraform Data Sources to retrieve information from both local systems and AWS resources. It demonstrated how Terraform can interact with existing infrastructure without creating or modifying resources.

These concepts are fundamental in real-world DevOps, Cloud Engineering, Platform Engineering, and Infrastructure Automation environments where infrastructure discovery and integration are common requirements.

---

# Course

KodeKloud - Terraform Basics Training Course

Lab: Datasources
