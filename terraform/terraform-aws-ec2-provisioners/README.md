# AWS EC2 and Provisioners with Terraform

## Overview

This lab demonstrates how to provision AWS infrastructure using Terraform, including the deployment of an EC2 instance, the creation of an SSH key pair, and the use of Terraform provisioners to execute local actions after resource creation.

The environment was configured against a LocalStack endpoint, allowing infrastructure provisioning and testing without creating resources in a real AWS account.

The lab also introduces the use of `user_data` scripts to automate software installation during instance initialization.

---

## Objectives

- Provision an EC2 instance using Terraform.
- Create and manage an AWS Key Pair.
- Execute initialization scripts with `user_data`.
- Use Terraform Provisioners.
- Associate an Elastic IP (EIP) with an EC2 instance.
- Automate post-deployment tasks using `local-exec`.
- Practice Infrastructure as Code (IaC) principles.

---

## Technologies Used

- Terraform
- AWS EC2
- AWS Elastic IP (EIP)
- AWS Key Pair
- LocalStack
- Bash
- Linux

---

## Project Structure

```text
terraform-aws-ec2-provisioners/
├── README.md
├── provider.tf
├── main.tf
├── install-nginx.sh
├── ssh/
│   └── cerberus.pub
└── screenshot/
```

---

## Provider Configuration

Terraform was configured to use the AWS provider and communicate with a LocalStack EC2 endpoint.

```hcl
provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://aws:4566"
  }
}
```

This configuration allows Terraform commands to interact with LocalStack instead of a real AWS account.

---

## EC2 Instance Deployment

An EC2 instance named `cerberus` was created using a predefined AMI and instance type.

```hcl
resource "aws_instance" "cerberus" {
  ami           = var.ami
  instance_type = var.instance_type

  user_data = file("./install-nginx.sh")
}
```

### Configuration Variables

```hcl
variable "ami" {
  default = "ami-06178cf087598769c"
}

variable "instance_type" {
  default = "m5.large"
}

variable "region" {
  default = "eu-west-2"
}
```

---

## Instance Bootstrap Script

The EC2 instance executes a startup script using the `user_data` attribute.

File:

```bash
install-nginx.sh
```

Content:

```bash
#!/bin/bash

sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
```

### Purpose

The script automatically:

1. Updates system packages.
2. Installs NGINX.
3. Starts the NGINX service.

This demonstrates how cloud instances can be configured automatically during deployment.

---

## SSH Key Pair Creation

Terraform creates an AWS Key Pair using an existing public SSH key.

```hcl
resource "aws_key_pair" "cerberus-key" {
  key_name   = "cerberus"
  public_key = file("ssh/cerberus.pub")
}
```

### Benefits

- Enables secure SSH authentication.
- Avoids password-based access.
- Supports automated infrastructure provisioning.

---

## Elastic IP Assignment

An Elastic IP was associated with the EC2 instance.

```hcl
resource "aws_eip" "eip" {
  vpc      = true
  instance = aws_instance.cerberus.id
}
```

### Purpose

Elastic IP addresses provide a static public endpoint that remains associated with the instance.

---

## Terraform Provisioners

A `local-exec` provisioner was used to execute a command on the machine running Terraform.

```hcl
provisioner "local-exec" {
  command = "echo ${aws_eip.eip.public_dns} >> /root/cerberus_public_dns.txt"
}
```

### What It Does

After the Elastic IP is created:

- Terraform retrieves the generated public DNS.
- The DNS value is stored locally.
- The information is appended to:

```text
/root/cerberus_public_dns.txt
```

This demonstrates how Terraform can trigger additional automation tasks after infrastructure deployment.

---

## Terraform Workflow

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Review execution plan:

```bash
terraform plan
```

Deploy infrastructure:

```bash
terraform apply
```

Destroy resources:

```bash
terraform destroy
```

---

## Resources Created

The following resources were managed by Terraform:

| Resource | Purpose |
|-----------|-----------|
| aws_instance | EC2 virtual machine |
| aws_key_pair | SSH authentication |
| aws_eip | Static public IP |
| local-exec provisioner | Local automation task |

---

## Key Concepts Learned

### Infrastructure as Code (IaC)

Infrastructure can be defined, versioned, and deployed using code.

### User Data

Cloud-init scripts automate instance configuration during startup.

### Provisioners

Provisioners allow Terraform to execute actions during resource creation or destruction.

### Elastic IP

Provides a persistent public address for cloud resources.

### Key Pair Management

SSH keys improve security and enable automated access.

---

## Skills Practiced

- Terraform fundamentals
- AWS EC2 provisioning
- Infrastructure as Code
- User Data automation
- Elastic IP management
- SSH Key Pair configuration
- Terraform Provisioners
- LocalStack integration
- Cloud infrastructure deployment

---

## Learning Outcome

Through this lab, an EC2 instance was successfully provisioned using Terraform and configured automatically through a startup script. An SSH Key Pair was created for secure access, an Elastic IP was associated with the instance, and a local-exec provisioner was used to automate post-deployment actions. The exercise provided practical experience with Infrastructure as Code, resource dependencies, and infrastructure automation using Terraform.

---

## Course Information

**Course:** Terraform for Beginners

**Platform:** KodeKloud

**Lab Name:** AWS EC2 and Provisioners

**Category:** Terraform AWS Infrastructure Provisioning

**Focus Areas:**

- EC2 Deployment
- User Data Scripts
- SSH Key Management
- Elastic IP Association
- Terraform Provisioners
- Infrastructure Automation
