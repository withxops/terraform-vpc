# 🌐 Terraform AWS VPC Module

![Terraform](https://img.shields.io/badge/Terraform-1.0+-blue)
![AWS](https://img.shields.io/badge/AWS-VPC-orange)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📌 Overview

This repository provides a reusable and production-ready **Terraform configuration** to provision a complete AWS VPC infrastructure. It follows industry best practices for networking, scalability, and environment isolation.

---

## 🚀 What This Project Does

* Creates a custom **VPC**
* Provisions **Public & Private Subnets**
* Attaches an **Internet Gateway (IGW)**
* Configures a **NAT Gateway** for private subnet internet access
* Sets up **Route Tables & Associations**
* Supports **environment-based configurations (dev/prod)**

---

## 🏗️ Architecture Components

This Terraform setup creates:

* VPC (default: `10.0.0.0/16`)
* 2 Public Subnets
* 2 Private Subnets
* Internet Gateway
* NAT Gateway (for outbound internet from private subnets)
* Route Tables (Public & Private)

---

## 📂 Project Structure

```
terraform-vpc/
│── modules/
│    │── main.tf
│    │── variables.tf
│    │── outputs.tf
│
│── main.tf
│── variables.tf
│── terraform.tfvars
│── provider.tf
|── terraform.tf
│── README.md
```

---

## ⚙️ Prerequisites

Ensure you have the following installed and configured:

* Terraform >= 1.0
* AWS CLI (`aws configure` done)
* IAM permissions for VPC resources

---

## 🔧 How to Use

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/withxops/terraform-vpc.git
cd terraform-vpc
```

### 2️⃣ Initialize Terraform

```bash
terraform init
```

### 3️⃣ Configure Variables

Edit `terraform.tfvars` file:

```hcl
region          = "ap-south-1"
env             = "dev"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
```

### 4️⃣ Plan the Infrastructure

```bash
terraform plan
```

### 5️⃣ Apply the Configuration

```bash
terraform apply
```

---

## 📤 Outputs

After successful deployment, Terraform will output:

* VPC ID
* Public Subnet IDs
* Private Subnet IDs
* NAT Gateway ID

---

## 🔐 Best Practices Implemented

* Infrastructure as Code (IaC)
* Modular & reusable design
* Environment-based tagging (`dev`, `prod`)
* Separation of public and private networks
* Secure outbound access via NAT

---

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## 🤝 Contributing

Feel free to fork this repository and raise a pull request.

---

## 📄 License

This project is licensed under the **MIT License**.

---

## 👨‍💻 Author

**Mohan Kumar**

GitHub: [https://github.com/withxops]
(https://github.com/withxops)

---

## ⭐ Support

If you find this useful, consider giving it a ⭐ on GitHub!
