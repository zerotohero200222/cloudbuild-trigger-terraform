variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "repository_name" {
  description = "Cloud Source Repository name"
  type        = string
}

variable "service_account_email" {
  description = "Cloud Build service account email"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, uat, prod)"
  type        = string
}

variable "branch_pattern" {
  description = "Branch to trigger on"
  type        = string
}
