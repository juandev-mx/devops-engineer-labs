# Terraform Workspaces

## Overview

This lab demonstrates how Terraform Workspaces can be used to manage multiple environments from a single Terraform configuration.

Different environments are configured through workspace-specific values using the `terraform.workspace` expression and Terraform maps.

## Technologies Used

- Terraform
- AWS Provider
- LocalStack
- AWS EC2
- AWS S3
- AWS DynamoDB

## Project Structure

```text
├── screenshot/
├── provider.tf
├── variables.tf
├── main.tf
└── README.md
```

## Workspace Configuration

### Available Workspaces

```bash
default
us-payroll
uk-payroll
india-payroll
```

### Main Configuration

```hcl
module "payroll_app" {
  source = "/root/terraform-projects/modules/payroll-app"

  app_region = lookup(var.region, terraform.workspace)
  ami        = lookup(var.ami, terraform.workspace)
}
```

## Variables

The project uses maps to define environment-specific values.

### Regions

| Workspace | Region |
|------------|----------|
| us-payroll | us-east-1 |
| uk-payroll | eu-west-2 |
| india-payroll | ap-south-1 |

## Managed Resources

Terraform provisions the following resources through the module:

- EC2 Instance
- DynamoDB Table
- S3 Bucket

## Commands

### Initialize Terraform

```bash
terraform init
```

### List Workspaces

```bash
terraform workspace list
```

### Create Workspace

```bash
terraform workspace new us-payroll
```

### Switch Workspace

```bash
terraform workspace select india-payroll
```

### Generate Execution Plan

```bash
terraform plan
```

### Apply Changes

```bash
terraform apply
```

## Learning Objectives

- Understand Terraform Workspaces
- Manage multiple environments
- Use terraform.workspace
- Configure workspace-specific variables
- Reuse Terraform modules
- Apply Infrastructure as Code principles

## Skills Demonstrated

- Terraform
- Terraform Workspaces
- AWS Infrastructure
- Infrastructure as Code (IaC)
- Modular Terraform Design
- Environment Isolation

# Course Information

Course: Terraform for Beginners

Lab: terraform Workspaces
