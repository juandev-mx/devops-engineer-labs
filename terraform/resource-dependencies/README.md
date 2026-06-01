# Terraform Resource Dependencies Lab

Hands-on lab completed during the KodeKloud Terraform Basics Training Course.

This lab demonstrates how Terraform manages resource creation order using explicit dependencies and how resources can reference outputs from other resources.

---

# Objective

The objective of this lab was to understand:

- Resource dependencies
- Explicit dependencies using `depends_on`
- Resource execution order
- Terraform graph relationships
- Automatic resource generation
- RSA key generation using Terraform providers

---

# Technologies Used

| Category | Technology |
|-----------|------------|
| IaC | Terraform |
| Language | HCL |
| Provider | Local Provider |
| Provider | TLS Provider |
| Platform | Linux |
| Version Control | Git & GitHub |

---

# Project Structure

```text
resource-dependencies/
│
├── explicit-dependency/
│   └── main.tf
│
├── key-generator/
│   └── key.tf
│
└── README.md
```
---

# Lab 1: Explicit Resource Dependency

## File

```hcl
resource "local_file" "whale" {
  filename   = "/root/whale"
  content    = "whale"
  depends_on = [local_file.krill]
}

resource "local_file" "krill" {
  filename = "/root/krill"
  content  = "krill"
}
```

---

## Explanation

Terraform normally determines resource order automatically.

In this example, an explicit dependency was added using:

```hcl
depends_on = [local_file.krill]
```

This forces Terraform to:

1. Create the `krill` file first.
2. Create the `whale` file afterwards.

---

## Resources Created

Terraform generates:

```text
/root/krill
/root/whale
```

Contents:

### krill

```text
krill
```

### whale

```text
whale
```

---

## Dependency Graph

```text
local_file.krill
        │
        ▼
local_file.whale
```

---

# Lab 2: RSA Key Generator

## File

```hcl
resource "tls_private_key" "pvtkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "key_details" {
  content  = tls_private_key.pvtkey.private_key_pem
  filename = "/root/key.txt"
}
```

---

## Explanation

This configuration uses the TLS Provider to generate a secure RSA private key.

Terraform then writes the generated key into a local file.

---

## Resources Created

Terraform generates:

```text
/root/key.txt
```

The file contains:

```text
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
```

---

## Security Note

The generated private key should never be committed to a public Git repository.

Best practice:

```gitignore
*.pem
*.key
key.txt
```

Terraform configurations should be stored, but generated secrets should remain private.

---

# Terraform Commands Used

Initialize providers:

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

Create resources:

```bash
terraform apply
```

Destroy resources:

```bash
terraform destroy
```

---

# Skills Demonstrated

- Infrastructure as Code (IaC)
- Terraform fundamentals
- HCL syntax
- Resource dependencies
- Dependency management
- Local provider usage
- TLS provider usage
- RSA key generation
- Terraform execution workflow
- Infrastructure automation

---

# Key Concepts Learned

## Explicit Dependencies

Terraform allows manual control of resource execution order using:

```hcl
depends_on
```

This is useful when resources must be created in a specific sequence.

---

## Provider Integration

Terraform can interact with different providers such as:

- Local
- TLS
- AWS
- Azure
- Google Cloud

through a unified workflow.

---

## Secret Management Awareness

Generating secrets with Terraform is simple, but storing them securely is critical.

Sensitive files should:

- Not be committed to Git
- Be protected with permissions
- Be stored in secret management systems

Examples:

- AWS Secrets Manager
- HashiCorp Vault
- Azure Key Vault
- Google Secret Manager

---

# Learning Outcome

This lab provided practical experience with Terraform resource relationships and dependency management while introducing secure secret generation using the TLS provider.

These concepts are fundamental for real-world Infrastructure as Code implementations used in DevOps, Cloud Engineering, Platform Engineering, and Site Reliability Engineering (SRE) environments.

---

# Course

KodeKloud - Terraform Basics Training Course

Lab: Resource Dependencies
