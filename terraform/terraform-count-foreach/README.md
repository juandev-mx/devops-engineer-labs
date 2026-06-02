# 🔁 Terraform Count and for_each Lab

## 📖 Overview

This lab was completed as part of the **Terraform Basics Training Course** from KodeKloud.

The objective of this exercise was to understand how Terraform can dynamically create multiple resources using iteration techniques. In this case, the `for_each` meta-argument was used to generate multiple local files from a list of user paths.

This approach is commonly used in Infrastructure as Code (IaC) environments where large numbers of similar resources must be created, managed, and maintained efficiently.

---

# 🎯 Learning Objectives

During this lab, the following Terraform concepts were practiced:

* Understanding Terraform meta-arguments
* Using `for_each` to iterate through collections
* Working with lists and sets
* Creating multiple resources dynamically
* Managing sensitive file content
* Eliminating duplicate values using `toset()`
* Understanding resource addressing in Terraform State

---

# 🏗️ Project Structure

```text
terraform-count-foreach/
├── main.tf
├── variables.tf
├── .terraform.lock.hcl
└── README.md
├── screenshot/
```

---

# 📄 Terraform Configuration

## main.tf

```hcl
resource "local_sensitive_file" "name" {
    for_each = toset(var.users)

    filename = each.value
    content  = var.content
}
```

This resource creates multiple local files using the values provided in the `users` variable.

The `for_each` meta-argument iterates through each unique element in the collection and creates a separate resource instance for every value.

---

## variables.tf

```hcl
variable "users" {
    type = list(string)

    default = [
        "/root/user10",
        "/root/user11",
        "/root/user12",
        "/root/user10"
    ]
}

variable "content" {
    default = "password: S3cr3tP@ssw0rd"
}
```

The lab defines a list of user file paths and a shared content string.

Notice that `/root/user10` appears twice in the list.

Because the list is converted into a set using:

```hcl
toset(var.users)
```

Terraform automatically removes duplicate values before resource creation.

---

# 🔄 Understanding for_each

The `for_each` meta-argument creates one resource instance for every unique element in a collection.

Terraform converts:

```hcl
[
 "/root/user10",
 "/root/user11",
 "/root/user12",
 "/root/user10"
]
```

into:

```hcl
{
 "/root/user10",
 "/root/user11",
 "/root/user12"
}
```

Resulting in only three resources being created.

---

# 📁 Generated Resources

Terraform created the following files:

```text
/root/user10
/root/user11
/root/user12
```

Each file contained:

```text
password: S3cr3tP@ssw0rd
```

---

# 📊 Terraform State Resources

After applying the configuration, Terraform registered the following resources:

```text
local_sensitive_file.name["/root/user10"]
local_sensitive_file.name["/root/user11"]
local_sensitive_file.name["/root/user12"]
```

These entries demonstrate how Terraform uniquely tracks each resource instance created through `for_each`.

---

# 🔒 Sensitive Resources

This lab uses:

```hcl
local_sensitive_file
```

instead of:

```hcl
local_file
```

Sensitive resources help prevent confidential information from being displayed in Terraform output.

This is especially useful when handling:

* Passwords
* API Keys
* Tokens
* Certificates
* Secrets

---

# ⚙️ Terraform Commands Used

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

Deploy resources:

```bash
terraform apply
```

Destroy resources:

```bash
terraform destroy
```

---

# 🧠 Key Concepts Learned

## for_each

Creates one resource per collection item.

Example:

```hcl
for_each = toset(var.users)
```

---

## toset()

Converts a list into a set.

Benefits:

* Removes duplicate values
* Ensures uniqueness
* Enables compatibility with `for_each`

---

## each.value

Represents the current value being processed.

Example:

```hcl
filename = each.value
```

For every iteration:

```text
Iteration 1 → /root/user10
Iteration 2 → /root/user11
Iteration 3 → /root/user12
```

---

# 🏢 Real-World Use Cases

The same pattern is commonly used to create:

* IAM Users
* AWS S3 Buckets
* EC2 Instances
* Security Groups
* DNS Records
* Kubernetes Namespaces
* Cloud Storage Accounts
* Service Accounts

Example:

```hcl
resource "aws_iam_user" "users" {
  for_each = toset(var.usernames)

  name = each.value
}
```

---

# 🚀 Skills Demonstrated

* Terraform Fundamentals
* Infrastructure as Code (IaC)
* Resource Iteration
* Dynamic Resource Creation
* Variable Management
* Terraform State Management
* HashiCorp Configuration Language (HCL)
* Infrastructure Automation

---

# 📚 Course Information

**Course:** Terraform Basics Training Course

**Platform:** KodeKloud

**Lab:** Count and for_each

---

# ✅ Outcome

This lab demonstrated how Terraform can efficiently create and manage multiple resources through iteration using `for_each`.

By combining variables, collections, and Terraform meta-arguments, repetitive infrastructure definitions can be replaced with scalable and maintainable code, following Infrastructure as Code best practices used in modern DevOps and Cloud Engineering environments.
