# main.tf
# Fixed version - Removed API enablement as they're already enabled

# Cloud Build Trigger
resource "google_cloudbuild_trigger" "csr_trigger" {
  name        = "cloud-run-scaling-${var.environment}"
  description = "Build trigger for ${var.environment} environment"
  project     = var.project_id
  location    = var.region

  trigger_template {
    project_id  = var.project_id
    repo_name   = var.repository_name
    branch_name = "^${var.branch_pattern}$"
  }

  filename = "cloudbuild.yaml"

  service_account = "projects/${var.project_id}/serviceAccounts/${var.service_account_email}"

  substitutions = {
    _ENV        = var.environment
    _PROJECT_ID = var.project_id
    _REGION     = var.region
  }

  included_files = [
    "main.tf",
    "variables.tf",
    "outputs.tf",
    "cloudbuild.yaml",
    "environments/${var.environment}.tfvars"
  ]

  ignored_files = [
    "*.md",
    "docs/**"
  ]
}
