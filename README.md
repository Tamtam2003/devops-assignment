\# Notepad App CI/CD on AWS EKS



\## 📌 Project Overview

This project demonstrates a complete DevOps pipeline by deploying a Flask-based \*\*Notepad Application\*\* to \*\*AWS EKS\*\* using \*\*Helm\*\* and automating the process with \*\*GitHub Actions\*\*.  

It integrates Infrastructure-as-Code (Terraform), containerization (Docker), orchestration (Kubernetes), and CI/CD automation.



---



\## 🏗️ Architecture

1\. \*\*Flask App\*\* → Containerized with \*\*Docker\*\* and pushed to DockerHub.  

2\. \*\*Terraform\*\* → Provisions AWS infrastructure (VPC, EKS cluster, Node Group, ECR).  

3\. \*\*Helm\*\* → Manages Kubernetes manifests and deploys the app to EKS.  

4\. \*\*GitHub Actions\*\* → Automates CI/CD: build → push → deploy.  



---



\## 🚀 Steps Implemented

\- \*\*Infrastructure (Terraform)\*\*  

&nbsp; - VPC, subnets, Internet Gateway, Route Tables.  

&nbsp; - EKS cluster + Node Group.  

&nbsp; - ECR repository (for Docker images).  



\- \*\*Application (Docker)\*\*  

&nbsp; - Created `Dockerfile` for Flask app.  

&nbsp; - Built and pushed image to DockerHub:  

&nbsp;   ```bash

&nbsp;   docker build -t tamarmey/notepad-app:1.0 ./app

&nbsp;   docker push tamarmey/notepad-app:1.0

&nbsp;   ```



\- \*\*Deployment (Helm)\*\*  

&nbsp; - Created custom Helm chart (`hello-chart`).  

&nbsp; - Defined Deployment, Service (LoadBalancer), and values.  

&nbsp; - Installed with:  

&nbsp;   ```bash

&nbsp;   helm upgrade --install notepad ./helm/hello-chart -n default

&nbsp;   ```



\- \*\*CI/CD (GitHub Actions)\*\*  

&nbsp; - Workflow triggered on push to `main`.  

&nbsp; - Steps: checkout → build → push image → configure AWS → deploy with Helm.  

&nbsp; - Secrets used: `DOCKERHUB\_USERNAME`, `DOCKERHUB\_TOKEN`, `AWS\_ACCESS\_KEY\_ID`, `AWS\_SECRET\_ACCESS\_KEY`, `AWS\_REGION`.  



---



\## 📷 Results

\- Application successfully deployed to AWS EKS.  

\- Accessible publicly through AWS LoadBalancer.  

\- GitHub Actions pipeline runs automatically on push to `main`.  



\*(Insert screenshot of app running + screenshot of GitHub Actions success)\*  



---



\## 📚 What I Learned

\- Managing \*\*Terraform\*\* for real AWS infrastructure.  

\- Using \*\*Helm charts\*\* for Kubernetes deployments.  

\- Automating full pipeline with \*\*GitHub Actions\*\*.  

\- Debugging ports, services, and load balancer connections in Kubernetes.  



---



\## 🛠️ How to Reproduce

1\. Clone this repository.  

2\. Configure AWS credentials + DockerHub secrets in GitHub.  

3\. Push changes → CI/CD workflow triggers automatically.  

4\. Access app via the LoadBalancer URL.  



---



