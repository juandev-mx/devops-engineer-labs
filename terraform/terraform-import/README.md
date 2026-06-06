# Terraform Import

## Overview

This lab demonstrates how to manage existing AWS resources using Terraform and how Terraform can be used to bring previously created infrastructure under Infrastructure as Code (IaC) management.

The exercise focuses on defining EC2 instances through Terraform configuration, managing multiple resources using `for_each`, and working with Terraform state to track imported infrastructure resources.

The environment uses LocalStack to emulate AWS services, allowing Terraform operations to be performed without provisioning resources in a real AWS account.

---

## Objectives

* Configure the AWS Provider in Terraform.
* Create multiple EC2 instances using `for_each`.
* Manage infrastructure using variables.
* Define resource tags dynamically.
* Understand Terraform state management.
* Learn Terraform Import concepts.
* Track existing infrastructure resources within Terraform state.

---

## Technologies Used

* Terraform
* AWS EC2
* AWS Provider
* LocalStack
* Infrastructure as Code (IaC)
* Linux
* Bash

---

## Project Structure

```text
terraform-import/
├── README.md
├── provider.tf
├── variables.tf
├── main.tf
└── screenshot/```

---

## Provider Configuration

The AWS provider was configured to use a LocalStack endpoint instead of a real AWS account.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.15.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://aws:4566"
  }
}
```

This configuration allows Terraform to interact with LocalStack's EC2 service for testing and learning purposes.

---

## Variables Configuration

Variables were used to define reusable infrastructure parameters.

```hcl
variable "name" {
  type = set(string)

  default = [
    "jade-webserver",
    "jade-lbr",
    "jade-app1",
    "jade-agent",
    "jade-app2"
  ]
}

variable "ami" {
  default = "ami-0c9bfc21ac5bf10eb"
}

variable "instance_type" {
  default = "t2.nano"
}

variable "key_name" {
  default = "jade"
}
```

Using variables improves maintainability and allows infrastructure to be easily modified without changing resource definitions.

---

## Creating Multiple EC2 Instances

Terraform's `for_each` meta-argument was used to create multiple EC2 instances from a set of names.

```hcl
resource "aws_instance" "ruby" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = var.name
  key_name      = var.key_name

  tags = {
    Name = each.value
  }
}
```

This configuration automatically provisions the following instances:

* jade-webserver
* jade-lbr
* jade-app1
* jade-agent
* jade-app2

Using `for_each` reduces code duplication and improves scalability.

---

## Additional EC2 Instance

A separate EC2 instance was defined outside the loop.

```hcl
resource "aws_instance" "jade-mw" {
  ami           = "ami-082b3eca746b12a89"
  instance_type = "t2.large"
  key_name      = "jade"

  tags = {
    Name = "jade-mw"
  }

  timeouts {}
}
```

This resource demonstrates how Terraform can manage individual resources alongside dynamically generated infrastructure.

---

## Outputs

Terraform outputs were used to expose information about the created instances.

```hcl
output "instances" {
  value = aws_instance.ruby
}
```

Outputs help retrieve resource attributes after deployment and simplify infrastructure validation.

---

## Terraform State Resources

The following resources were successfully tracked in Terraform state:

```text
aws_instance.jade-mw
aws_instance.ruby["jade-agent"]
aws_instance.ruby["jade-app1"]
aws_instance.ruby["jade-app2"]
aws_instance.ruby["jade-lbr"]
aws_instance.ruby["jade-webserver"]
```

Terraform state enables infrastructure tracking and synchronization between configuration files and deployed resources.

---

## Terraform Import Concept

Terraform Import allows existing infrastructure resources to be brought under Terraform management without recreating them.

Typical workflow:

```bash
terraform import RESOURCE_NAME RESOURCE_ID
```

Example:

```bash
terraform import aws_instance.web i-1234567890abcdef0
```

After importing a resource, Terraform records it in the state file, allowing future management through Terraform.

---

## Key Concepts Learned

### Infrastructure as Code (IaC)

Infrastructure can be defined, versioned, and managed using code instead of manual configuration.

### Terraform State

Terraform stores information about managed resources inside the state file.

### Resource Import

Existing resources can be imported into Terraform state and managed without redeployment.

### for_each

The `for_each` meta-argument allows scalable creation of multiple resources from collections.

### Variables

Variables increase flexibility and improve code reusability.

---

## Skills Practiced

* Terraform fundamentals
* AWS Provider configuration
* EC2 instance management
* Infrastructure as Code (IaC)
* Terraform state management
* Terraform Import concepts
* Resource tagging
* Dynamic resource creation
* LocalStack integration

---

## Learning Outcome

Through this lab, multiple EC2 instances were managed using Terraform and LocalStack. The exercise demonstrated how to define scalable infrastructure using variables and `for_each`, manage resources through Terraform state, and understand the principles behind Terraform Import. This hands-on experience strengthened knowledge of Infrastructure as Code practices and resource lifecycle management.

---

## Course Information

**Learning Path:** KodeKloud DevOps Engineer Learning Path

**Course:** Terraform for Beginners

**Lab:** Terraform Import

**Platform:** KodeKloud

This hands-on lab focused on importing and managing existing infrastructure resources with Terraform while reinforcing Terraform state management and Infrastructure as Code best practices.
