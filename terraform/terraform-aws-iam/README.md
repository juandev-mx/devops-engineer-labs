# IAM with Terraform

## Overview

This lab demonstrates how to provision and manage AWS Identity and Access Management (IAM) users using Terraform. The exercise was performed against a LocalStack environment, allowing AWS resources to be created and managed without using a real AWS account.

The lab focuses on Infrastructure as Code (IaC) principles by defining IAM users declaratively through Terraform configuration files and automatically provisioning multiple resources using the `count` meta-argument.

---

## Objectives

- Configure the AWS provider in Terraform.
- Connect Terraform to a LocalStack environment.
- Create multiple IAM users using Infrastructure as Code.
- Use Terraform variables to manage resource definitions.
- Implement the `count` meta-argument for resource creation.
- Validate created resources using Terraform state.

---

## Technologies Used

- Terraform
- AWS IAM
- LocalStack
- AWS Provider
- Linux
- Infrastructure as Code (IaC)

---

## Project Structure

```text
terraform-aws-iam/
├── provider.tf
├── variables.tf
├── iam-user.tf
├── README.md
└── screenshots/
```

---

## Provider Configuration

The AWS provider was configured to communicate with a LocalStack endpoint instead of the public AWS cloud.

### provider.tf

```hcl
provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    iam = "http://aws:4566"
  }
}
```

### Explanation

- `region`: Specifies the AWS region.
- `skip_credentials_validation`: Disables AWS credential validation.
- `skip_requesting_account_id`: Avoids account lookup operations.
- `iam endpoint`: Redirects IAM API calls to LocalStack.

This configuration enables local testing of Terraform deployments without AWS charges.

---

## Variable Definition

A list of IAM usernames was defined using a Terraform variable.

### variables.tf

```hcl
variable "project-sapphire-users" {
     type = list(string)

     default = [
       "mary",
       "jack",
       "jill",
       "mack",
       "buzz",
       "mater"
     ]
}
```

### Explanation

The variable stores all usernames that Terraform will create.

This approach improves maintainability because users can be added or removed by modifying only the variable definition.

---

## IAM User Resource

Terraform creates multiple IAM users dynamically using the `count` meta-argument.

### iam-user.tf

```hcl
resource "aws_iam_user" "users" {
     name  = var.project-sapphire-users[count.index]
     count = length(var.project-sapphire-users)
}
```

### Explanation

Terraform evaluates the length of the user list and creates one IAM user for each element.

The resource names are generated from:

```hcl
var.project-sapphire-users[count.index]
```

This allows scalable creation of multiple users without duplicating resource blocks.

---

## Terraform Workflow

Initialize Terraform:

```bash
terraform init
```

Review the execution plan:

```bash
terraform plan
```

Create IAM users:

```bash
terraform apply
```

Verify deployed resources:

```bash
terraform state list
```

---

## Terraform State Verification

The deployed resources were successfully stored in Terraform state.

```text
aws_iam_user.users[0]
aws_iam_user.users[1]
aws_iam_user.users[2]
aws_iam_user.users[3]
aws_iam_user.users[4]
aws_iam_user.users[5]
```

Terraform created the following IAM users:

| Index | Username |
|---------|----------|
| 0 | mary |
| 1 | jack |
| 2 | jill |
| 3 | mack |
| 4 | buzz |
| 5 | mater |

---

## Infrastructure as Code Benefits

### Declarative Configuration

Infrastructure is defined through code rather than manual configuration.

### Scalability

Additional IAM users can be created simply by updating the user list variable.

### Reproducibility

The same infrastructure can be recreated consistently across environments.

### Version Control

Terraform configuration files can be stored and tracked in Git repositories.

---

## Key Concepts Learned

### AWS IAM

AWS Identity and Access Management (IAM) controls authentication and authorization for AWS resources.

### Terraform Provider

Providers allow Terraform to interact with external platforms and APIs.

### Variables

Variables make Terraform configurations reusable and easier to maintain.

### Count Meta-Argument

The `count` meta-argument creates multiple resource instances from a single resource block.

### Terraform State

Terraform state tracks deployed infrastructure and enables lifecycle management.

---

## Skills Practiced

- Terraform fundamentals
- AWS IAM administration
- Infrastructure as Code (IaC)
- Provider configuration
- Resource provisioning
- Terraform variables
- Count meta-argument
- State management
- LocalStack integration

---

## Learning Outcome

Through this lab, multiple IAM users were successfully provisioned using Terraform and LocalStack. The exercise demonstrated how Infrastructure as Code can automate identity management tasks while reducing manual configuration effort. By using variables and the `count` meta-argument, user creation became scalable, repeatable, and easier to maintain.

---

## Course Information

**Course:** Terraform for Beginners

**Platform:** KodeKloud

**Lab:** IAM with Terraform

**Topic:** AWS Identity and Access Management (IAM), Terraform Providers, Variables, Count Meta-Argument, and Infrastructure as Code (IaC).

This hands-on lab demonstrates how Terraform can automate IAM user provisioning through reusable and scalable infrastructure definitions.
