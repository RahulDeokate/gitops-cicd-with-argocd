---

# 🚀 GitOps with ArgoCD on Amazon EKS

## 📌 Overview
This project implements a *GitOps-based Continuous Delivery workflow* using *ArgoCD* and *Amazon EKS*.  
The main goal is to *automate Kubernetes deployments* directly from GitHub without manual intervention.  

Whenever changes are pushed to this repository, *ArgoCD* automatically detects and synchronizes the updated application to the EKS cluster.

---

## 🛠 Tech Stack
| Category        | Technology |
|-----------------|------------|
| *Cloud*       | AWS (EKS, VPC, IAM, S3, DynamoDB) |
| *IaC*         | Terraform (Modular Approach) |
| *Container*   | Docker |
| *Orchestration* | Kubernetes |
| *GitOps*      | ArgoCD |
| *CI/CD*       | GitHub Actions / Jenkins (Optional) |
| *Version Control* | Git + GitHub |

---

## 📂 Project Structure

gitpos-cicd-with-agrocd/
│
├── app/                          # Application source code
│   ├── index.html
│   ├── styles.css
│   ├── Dockerfile
│   └── ...
│
├── k8s/                          # Kubernetes manifests (watched by ArgoCD)
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│
│
├── terraform/                    # Terraform IaC (modular structure)
│   ├── main.tf                    # Calls the modules
│   ├── variables.tf               # Root-level variables
│   ├── outputs.tf                 # Root-level outputs
│   ├── terraform.tfvars           # Values for variables
│   ├── backend.tf                 # S3 + DynamoDB backend config
│   └── modules/
│       ├── vpc/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── eks/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── nodegroup/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
│    
│
├── .gitignore
├── README.md
└── Jenkinsfile
---

## ⚡ How It Works
1. *Infrastructure Setup*
   - Terraform provisions AWS VPC, EKS cluster, and worker nodes.
   - S3 + DynamoDB are used for Terraform remote backend and state locking.

2. *Application Build & Push*
   - Application is containerized with Docker.
   - Image is pushed to Docker Hub.

3. *Deployment with ArgoCD*
   - Kubernetes manifests are stored in this repo.
   - ArgoCD continuously monitors the repo and applies changes to EKS.

---