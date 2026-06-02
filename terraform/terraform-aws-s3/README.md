# AWS S3 with Terraform

## Overview

This lab demonstrates how to provision and manage Amazon S3 resources using Terraform. The exercise was completed in a LocalStack environment, allowing AWS S3 operations to be performed locally without using a real AWS account.

The lab covers the creation of S3 buckets and the upload of objects using Terraform resources and the AWS provider.

---

## Objectives

* Configure the AWS provider for LocalStack.
* Create Amazon S3 buckets using Terraform.
* Upload files to an S3 bucket.
* Understand Terraform resource management.
* Practice Infrastructure as Code (IaC) concepts.
* Manage cloud resources declaratively.

---

## Technologies Used

* Terraform
* AWS S3
* AWS Provider
* LocalStack
* Linux
* Infrastructure as Code (IaC)

---

## Project Structure

```text
terraform-aws-s3/
├── README.md
├── DC/
│   ├── provider.tf
│   └── main.tf
├── MCU/
│   ├── provider.tf
│   └── main.tf
├── Pixar/
│   ├── provider.tf
│   └── main.tf
└── screenshot/
```

---

## Environment Configuration

All exercises use LocalStack as a local AWS emulator.

Example provider configuration:

```terraform
provider "aws" {
  region                      = var.region
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://aws:4566"
  }
}
```

This configuration redirects Terraform operations to LocalStack instead of AWS.

---

# Exercise 1: Create an S3 Bucket (MCU)

## Terraform Configuration

File:

```terraform
resource "aws_s3_bucket" "marvel-cinematic-universe" {
  bucket = "mcu-202011121359"
}
```

## Purpose

This exercise creates an S3 bucket named:

```text
mcu-202011121359
```

Terraform manages the bucket lifecycle and keeps track of its state.

---

# Exercise 2: Create an S3 Bucket (DC)

## Terraform Configuration

File:

```terraform
resource "aws_s3_bucket" "dc_bucket" {
  bucket = "dc-is-better-than-marvel"
}
```

## Purpose

This exercise provisions another S3 bucket with a custom name:

```text
dc-is-better-than-marvel
```

The goal is to practice bucket creation using Terraform resources.

---

# Exercise 3: Upload an Object to S3 (Pixar)

## Terraform Configuration

File:

```terraform
resource "aws_s3_object" "upload" {
  bucket = "pixar-studios-2020"
  key    = "woody.jpg"
  source = "/root/woody.jpg"
}
```

## Purpose

This exercise uploads an existing file into an S3 bucket.

### Parameters

| Parameter | Description              |
| --------- | ------------------------ |
| bucket    | Target S3 bucket         |
| key       | Object name stored in S3 |
| source    | Local file to upload     |

### Uploaded Object

```text
woody.jpg
```

This demonstrates how Terraform can manage not only infrastructure resources but also bucket contents.

---

## Terraform Workflow

Initialize Terraform:

```bash
terraform init
```

Review execution plan:

```bash
terraform plan
```

Apply changes:

```bash
terraform apply
```

Destroy resources when finished:

```bash
terraform destroy
```

---

## Resources Created

### S3 Buckets

* mcu-202011121359
* dc-is-better-than-marvel

### S3 Objects

* woody.jpg

---

## Key Concepts Learned

### Amazon S3

Amazon S3 is an object storage service used to store and retrieve data from anywhere.

### Terraform Resources

Resources define infrastructure components managed by Terraform.

Examples:

```terraform
aws_s3_bucket
aws_s3_object
```

### Infrastructure as Code

Infrastructure is defined using code, allowing version control, automation, and repeatable deployments.

### Terraform State

Terraform stores information about managed resources in a state file:

```text
terraform.tfstate
```

This state enables Terraform to track infrastructure changes over time.

---

## Skills Practiced

* Terraform fundamentals
* AWS provider configuration
* S3 bucket creation
* Object uploads to S3
* Infrastructure as Code
* LocalStack integration
* State management
* Resource lifecycle management

---

## Learning Outcome

Through this lab, multiple Amazon S3 resources were successfully managed using Terraform. S3 buckets were created, files were uploaded as objects, and Terraform state tracking was used to manage infrastructure changes. The exercise provided practical experience with Infrastructure as Code concepts while working in a LocalStack environment.

---

## Course Information

**Course:** Terraform for Beginners

**Platform:** KodeKloud

**Lab Name:** Lab: S3

**Module:** AWS Resources with Terraform

This hands-on lab focuses on managing Amazon S3 resources using Terraform, including bucket provisioning and object uploads through Infrastructure as Code practices.
