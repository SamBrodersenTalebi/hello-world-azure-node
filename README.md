# Hello World Azure Node App

## Introduction
This is a sample Node.js application that demonstrates the use of Express.js and is designed to be deployed on Azure. It also includes Docker and Terraform configurations.

## Prerequisites
- Node.js
- Docker
- Terraform
- Azure account
- Azure cli

## Installation

Clone the repository and navigate to the project directory:
```
git clone <repository-url>
cd hello-world-azure-node
```

Install the dependencies:
```
npm install
```

## Usage

To run the Express server locally:
```
npm start
```

## Dockerization

To create a Docker image and push it to Docker Hub (built for amd64 architecture):
1. Build the Docker image:
```
docker build --platform linux/amd64 -t <username>/hello-world-app:amd64 .
```

2. Push the Docker image to Docker Hub:
```
docker push <username>/hello-world-app:amd64
```

3. To run the Docker container locally:
```
docker run -d -p 3000:3000 <username>/hello-world-app:amd64
```

## Infrastructure Setup

Initialize and apply Terraform configurations:
1. Initialize Terraform:
```
terraform init
```

2. Plan and apply Terraform configurations:
```
terraform plan
terraform apply
```

## Solution

Find my solution here https://appservice-hello-world-sam-brodersen-77829.azurewebsites.net/hello