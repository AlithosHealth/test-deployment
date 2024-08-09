# Test-deployment (WIP)

# Contents

- Sample webserver code (NodeJS) that serves `/` and `/healthz` endpoints (the latter for Kubernetes health checks)
- Dockerfile for the webserver
- Helm values files for `staging` and `prod` deployment, using our centralized private helm chart repository
- TODO: Terraform infrastructure code setting up an ECR repo and a secret in both environments, with Terraform Cloud as the backend
- TODO: Github Actions workflows for building and pushing the Docker image to ECR and deploying the Helm chart for both deployments, using our centralized workflows
