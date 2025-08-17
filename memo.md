# working memo

## Initial Setup - Google Cloud Storage for Terraform

ref: https://cloud.google.com/docs/terraform/resource-management/store-state

1. create a new project

```bash
$ gcloud projects create ojiverse
```

Project name: `ojiverse`
Project number: 56226728303

Then, link the billing account on Web console before enabling services.

2. Enable services (now managed by Terraform)

```bash
$ gcloud services enable storage.googleapis.com
```

3. Create a new bucket via Terraform

Please check [./storage.tf](./storage.tf)

NOTE: if you fail to apply the terraform code, you have to complete [the setup of ADC](https://cloud.google.com/docs/authentication/provide-credentials-adc?hl=ja). And ensure the account (or service account) has been grant the permission to manage Cloud Storage Bucket.

4. migrate the current status with Storage bucket

```bash
$ terraform init -migrate-state
```

Now your tfstate is managed on Cloud Storage.

## GitHub Actions OIDC Federation Setup

### Files created:
- `gcp_apis.tf`: Enables required GCP APIs
- `github_oidc.tf`: Sets up Workload Identity Pool and Service Account
- `.github/workflows/terraform.yml`: GitHub Actions workflow

### Setup process:
1. Apply Terraform locally first to create OIDC resources
2. Get output values for GitHub secrets configuration
3. Configure repository secrets in GitHub
4. Test workflow by creating a PR

### Security benefits:
- No long-lived service account keys
- Scoped access only to specific GitHub repository
- Automatic token rotation
- Audit trail through GCP IAM logs

