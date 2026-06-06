# AWS CLI and IAM

## Overview

This lab demonstrates how to manage AWS Identity and Access Management (IAM) resources using the AWS Command Line Interface (CLI). The exercise was performed against a LocalStack environment, allowing IAM operations to be tested without creating resources in a real AWS account.

The lab covers common IAM administration tasks such as creating users, assigning policies, creating groups, and managing group permissions.

---

## Objectives

- Explore IAM commands using AWS CLI.
- Create IAM users.
- Attach managed policies to users.
- Create IAM groups.
- Add users to groups.
- Assign permissions through group policies.
- Verify user and group configurations.

---

## Technologies Used

- AWS CLI
- IAM (Identity and Access Management)
- LocalStack
- Linux
- Bash Shell

---

## Project Structure

```text
terraform-aws-cli-iam/
├── README.md
├── commands.txt
├── screenshots/
└── .gitkeep
```

---

## IAM User Management

The lab started by reviewing available IAM commands and listing existing users.

```bash
aws iam list-users
```

A new IAM user named `mary` was created:

```bash
aws --endpoint http://aws:4566 iam create-user \
  --user-name mary
```

Users were verified using:

```bash
aws --endpoint http://aws:4566 iam list-users
```

---

## Attaching Policies to Users

Administrator permissions were granted directly to the user `mary` using the AWS managed policy:

```bash
aws --endpoint http://aws:4566 iam attach-user-policy \
  --user-name mary \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

This demonstrates how permissions can be assigned directly to individual IAM users.

---

## IAM Group Management

A new IAM group named `project-sapphire-developers` was created:

```bash
aws --endpoint http://aws:4566 iam create-group \
  --group-name project-sapphire-developers
```

---

## Adding Users to Groups

Two users were added to the developer group:

```bash
aws --endpoint http://aws:4566 iam add-user-to-group \
  --user-name jack \
  --group-name project-sapphire-developers
```

```bash
aws --endpoint http://aws:4566 iam add-user-to-group \
  --user-name jill \
  --group-name project-sapphire-developers
```

This approach simplifies permission management by assigning permissions at the group level instead of individually for every user.

---

## Group Policy Assignment

The group received the AWS managed policy:

```bash
arn:aws:iam::aws:policy/AmazonEC2FullAccess
```

Using:

```bash
aws --endpoint http://aws:4566 iam attach-group-policy \
  --group-name project-sapphire-developers \
  --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
```

This allows all members of the group to inherit EC2 management permissions.

---

## Validation Commands

Verify user policies:

```bash
aws --endpoint http://aws:4566 iam list-attached-user-policies \
  --user-name jack
```

```bash
aws --endpoint http://aws:4566 iam list-attached-user-policies \
  --user-name jill
```

Verify group policies:

```bash
aws --endpoint http://aws:4566 iam list-attached-group-policies \
  --group-name project-sapphire-developers
```

---

## Key Concepts Learned

### IAM Users

IAM users represent identities that can authenticate and access AWS resources.

### IAM Groups

Groups simplify permission management by allowing policies to be assigned to multiple users at once.

### Managed Policies

AWS managed policies provide predefined permission sets maintained by AWS.

### Principle of Least Privilege

Permissions should be granted only as required to perform specific tasks.

---


## Skills Practiced

- AWS CLI navigation
- IAM administration
- User management
- Group management
- Policy attachment
- Access control
- AWS security fundamentals
- LocalStack integration

---

## Learning Outcome

Through this lab, IAM resources were successfully managed using AWS CLI commands. Users and groups were created, permissions were assigned through managed policies, and access configurations were validated. The exercise provided practical experience with AWS security administration concepts while working in a LocalStack environment

---

## Course Information

**Course:** Terraform for Beginners  
**Platform:** KodeKloud

**Lab:** AWS CLI and IAM

This hands-on lab focused on managing AWS Identity and Access Management (IAM) resources using the AWS Command Line Interface (CLI). The exercise covered creating IAM users, assigning managed policies, creating IAM groups, adding users to groups, and validating permissions. The lab was executed in a LocalStack environment, providing practical experience with AWS security administration concepts without requiring access to a production AWS account.

### Topics Covered

- AWS CLI Fundamentals
- IAM User Management
- IAM Group Management
- Managed Policies
- Access Control
- AWS Security Best Practices
- LocalStack Integration
