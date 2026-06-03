# Terraform AWS IAM User Module

Terraform project demonstrating the use of the official AWS IAM module to create and manage IAM users.

## Technologies

- Terraform
- AWS Provider
- IAM
- LocalStack

## Project Structure

```text
├── screenshot/
├── provider.tf
├── variables.tf
├── main.tf
└── README.md
```

## Configuration

### Provider

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  endpoints {
    iam = "http://aws:4566"
    ec2 = "http://aws:4566"
    s3 = "http://aws:4566"
  }
}
```

### IAM User

```hcl
module "iam_iam-user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.28.0"

  name                          = "max"
  create_iam_user_login_profile = false
  create_iam_access_key         = false
}
```

## Commands

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Generate execution plan:

```bash
terraform plan
```

Apply changes:

```bash
terraform apply
```

## Learning Objectives

- Terraform module usage
- AWS IAM user provisioning
- Infrastructure as Code (IaC)
- Terraform providers and variables
- LocalStack integration



# Course Information

Course: Terraform for Beginners

Lab: Terraform Modules – AWS IAM User Module
