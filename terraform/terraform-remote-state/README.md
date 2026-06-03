# Remote State with Terraform

## Overview

This lab demonstrates how to configure and use a remote Terraform state backend. Instead of storing the Terraform state file locally, the state is stored in an S3-compatible backend, allowing centralized state management and collaboration across multiple environments.

The exercise uses the HashiCorp Local provider to create a local file resource while configuring Terraform to store its state remotely in an S3 bucket named `remote-state`.

---

## Objectives

- Understand Terraform state management.
- Configure a remote backend using S3.
- Store Terraform state remotely instead of locally.
- Initialize Terraform with a backend configuration.
- Create resources while maintaining state in a centralized location.
- Learn the benefits of remote state storage for collaboration and infrastructure management.

---

## Technologies Used

- Terraform
- AWS S3 Backend
- S3-Compatible Storage (MinIO/LocalStack)
- HashiCorp Local Provider
- Linux
- Infrastructure as Code (IaC)

---

## Project Structure

```text
remote-state/
├── README.md
├── main.tf
├── terraform.tf
├── variables.tf
├── screenshot/
│   └── .gitkeep
└── .terraform.lock.hcl
```

---

## Terraform Configuration

### Resource Definition

The lab creates a local file using the Local Provider:

```terraform
resource "local_file" "state" {
  filename = "/root/${var.remote-state}"
  content  = "This configuration uses ${var.remote-state} state"
}
```

When Terraform is applied, a file named:

```text
/root/remote
```

is created with the following content:

```text
This configuration uses remote state
```

---

## Variables Configuration

### variables.tf

```terraform
variable remote-state {
    type = string
    default = "remote"
}

variable local-state {
    type = string
    default = "local"
}
```

### Variable Description

| Variable | Type | Default | Description |
|-----------|--------|----------|-------------|
| remote-state | string | remote | Used to define the filename and content for the remote state example |
| local-state | string | local | Reserved variable for local state comparison |

---

## Remote Backend Configuration

### terraform.tf

```terraform
terraform {
  backend "s3" {
    key    = "terraform.tfstate"
    region = "us-east-1"
    bucket = "remote-state"

    endpoints = {
      s3 = "http://localhost:9000"
    }

    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
  }
}
```

### Backend Parameters

| Parameter | Value |
|------------|---------|
| Backend Type | S3 |
| Bucket | remote-state |
| Key | terraform.tfstate |
| Region | us-east-1 |
| Endpoint | http://localhost:9000 |

---

## Why Remote State?

By default, Terraform stores state locally:

```text
terraform.tfstate
```

Local state works well for individual users but becomes problematic when multiple engineers manage the same infrastructure.

Remote state provides:

- Centralized storage
- Team collaboration
- State locking support
- Improved security
- Versioning capabilities
- Disaster recovery options

---

## Terraform Workflow

### Initialize Terraform

```bash
terraform init
```

Terraform initializes the backend and connects to the remote S3 storage.

---

### Review Execution Plan

```bash
terraform plan
```

Terraform calculates the actions required to create the resource.

---

### Apply Configuration

```bash
terraform apply
```

Expected result:

```text
local_file.state will be created
```

After approval, Terraform creates the file resource and stores the infrastructure state remotely.

---

### Verify Resources

```bash
terraform state list
```

Output:

```text
local_file.state
```

---

## Backend Initialization Process

When Terraform detects a backend configuration:

```terraform
backend "s3"
```

it performs the following actions:

1. Connects to the configured S3 endpoint.
2. Creates or accesses the specified bucket.
3. Uploads the state file.
4. Tracks future infrastructure changes remotely.

---

## Key Concepts Learned

### Terraform State

Terraform state is a file that maps real infrastructure resources to Terraform configurations.

### Local State

State is stored on the local machine:

```text
terraform.tfstate
```

### Remote State

State is stored in a centralized backend such as:

- AWS S3
- Azure Storage
- Google Cloud Storage
- Terraform Cloud
- MinIO
- LocalStack

### Backend

A backend determines where Terraform stores its state and how operations are executed.

---

## Skills Practiced

- Terraform backend configuration
- Remote state management
- Infrastructure as Code (IaC)
- State migration concepts
- S3 backend integration
- Resource deployment
- Terraform initialization
- State verification

---

## Learning Outcome

Through this lab, a Terraform project was configured to use a remote S3 backend for state storage. A local file resource was created while Terraform maintained the infrastructure state remotely. This exercise demonstrated how centralized state management improves collaboration, consistency, and scalability when managing infrastructure with Terraform.

---

## Course Information

**Course:** Terraform for Beginners

**Platform:** KodeKloud

**Lab Name:** Lab: Remote State

**Module:** Terraform State Management

**Repository Path:**

```text
terraform/remote-state
```

This lab focuses on configuring Terraform remote state storage using an S3-compatible backend and understanding the advantages of centralized state management in Infrastructure as Code workflows.
