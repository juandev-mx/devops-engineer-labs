# Terraform Workspaces

## Course Information

**Learning Path:** KodeKloud DevOps Engineer Program

**Course:** Terraform for Beginners

**Lab:** Terraform Workspaces

## Overview

This lab demonstrates how Terraform Workspaces can be used to manage multiple environments using a single Terraform configuration.

Different workspaces represent separate payroll environments:

* us-payroll
* uk-payroll
* india-payroll

Each workspace uses its own region and AMI values through Terraform maps and the `terraform.workspace` built-in variable.

## Technologies Used

* Terraform
* AWS Provider
* LocalStack
* Terraform Workspaces
* Infrastructure as Code (IaC)

## Project Structure

```text
.
├── main.tf
├── provider.tf
├── variables.tf
└── README.md
```

## Workspace Configuration

### Available Workspaces

```bash
terraform workspace list
```

Output:

```text
default
india-payroll
uk-payroll
us-payroll
```

### Switch Workspace

```bash
terraform workspace select us-payroll
```

### Create Workspace

```bash
terraform workspace new payroll-environment
```

## Main Configuration

```hcl
module "payroll_app" {
  source = "/root/terraform-projects/modules/payroll-app"

  app_region = lookup(var.region, terraform.workspace)
  ami        = lookup(var.ami, terraform.workspace)
}
```

## Learning Objectives

* Understand Terraform Workspaces
* Manage multiple environments with a single configuration
* Use workspace-specific variables
* Deploy infrastructure based on active workspace
* Organize Infrastructure as Code efficiently

## Skills Demonstrated

* Terraform
* Terraform Workspaces
* AWS Infrastructure
* Variable Maps
* Environment Isolation
* Infrastructure as Code (IaC)


# Course Information

Course: Terraform for Beginners

Lab: Terraform Modules – AWS IAM User Module
