# IaC for DNS record management of `ojiver.se`

This repository manages DNS records for `ojiver.se` domain using Terraform with Cloudflare provider and Google Cloud Storage for state management.

## Features

- ✅ DNS record management via Cloudflare
- ✅ Terraform state stored in Google Cloud Storage
- ✅ OIDC Federation for GitHub Actions authentication
- ✅ Automated Terraform apply via GitHub Actions

## Setup

### 1. Configure Terraform variables

Copy the example file and fill in your values:

```bash
cp terraform.tfvars.example terraform.tfvars
```

### 2. Initial Terraform setup

```bash
terraform init
terraform plan
terraform apply
```

### 3. Configure GitHub repository secrets

After the initial apply, configure these secrets in your GitHub repository:

- `WIF_PROVIDER`: Output from `workload_identity_provider`
- `WIF_SERVICE_ACCOUNT`: Output from `service_account_email`
- `CLOUDFLARE_API_TOKEN`: Your Cloudflare API token
- `CLOUDFLARE_ZONE_ID`: Your Cloudflare zone ID
- `GCP_PROJECT_ID`: Your GCP project ID
- `GITHUB_ORG_NAME`: Your GitHub organization name
- `GITHUB_REPO_NAME`: Your GitHub repository name

## GitHub Actions Workflow

The workflow automatically:
- Validates Terraform configuration on PRs
- Applies changes when merged to main branch
- Uses OIDC Federation for secure GCP authentication