variable "cloudflare_api_token" {
  description = "value of cloudflare api token"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "value of cloudflare zone id"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "github_org_name" {
  description = "GitHub organization name"
  type        = string
}

variable "github_repo_name" {
  description = "GitHub repository name"
  type        = string
}
