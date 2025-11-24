# main.tf
# GitHub Cloud Build Trigger (NO Source Repo)

resource "google_cloudbuild_trigger" "github_trigger" {
  name        = "cloud-run-scaling-${var.environment}"
  description = "GitHub build trigger for ${var.environment}"
  project     = var.project_id
  location    = var.region

  github {
    owner = var.repository_owner
    name  = var.repository_name

    push {
      branch = "^${var.branch_pattern}$"
    }
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
    "provider.tf",
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
