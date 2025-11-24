variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "repository_owner" {
  description = "GitHub repo owner"
  type        = string
}

variable "repository_name" {
  description = "GitHub repo name"
  type        = string
}

variable "service_account_email" {
  description = "Cloud Build service account"
  type        = string
}

variable "environment" {
  description = "Environment (dev / uat / prod)"
  type        = string
}

variable "branch_pattern" {
  description = "Branch regex to trigger on"
  type        = string
}
