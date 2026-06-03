# Terraform AWS IAM User Module

Terraform project demonstrating the use of the official AWS IAM module to create and manage IAM users.

## Technologies

- Terraform
- AWS Provider
- IAM
- LocalStack

## Project Structure

```text
.
├── provider.tf
├── variables.tf
├── main.tf
└── README.md
```

## Configuration

### Provider

```hcl
provider "aws" {
  region = var.region
}
```

### IAM User

```hcl
module "iam_iam-user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.28.0"

  name = "max"
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

## Author

Juan Carlos Reynoso Zuñiga
