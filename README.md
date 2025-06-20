# 🏗️ Terraform AWS Infrastructure Project 🚀  
**GitHub Repo:** [`Terraform-AWS-Infrastructure-Project`](git@github.com:victor-mungai/Terraform-AWS-Infrastructure-Project.git)

This project sets up a complete cloud infrastructure on **AWS using Terraform**, featuring:
- EC2 instance deployment
- Secure SSH key management
- Application Load Balancer (ALB)
- Security groups with custom rules
- Remote provisioning with a bash script

---

## 📦 What It Does

| Component          | Functionality                                                  |
|--------------------|----------------------------------------------------------------|
| ☁️ EC2 Instance     | Provisions a `t3.micro` instance in a public subnet           |
| 🔐 Key Pair         | Injects SSH key for secure access (private key `.gitignored`) |
| 🛡️ Security Group   | Allows HTTP (port 80) and SSH (port 22) from your IP          |
| 📁 Provisioning     | Copies & runs `web.sh` script to auto-install & serve static site |

---

## 🛠️ Setup Instructions

```bash
# Step 1: Initialize the project
terraform init

# Step 2: Review the execution plan
terraform plan

# Step 3: Apply the configuration
terraform apply
