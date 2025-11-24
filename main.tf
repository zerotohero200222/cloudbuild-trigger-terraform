# Enable required APIs
resource "google_project_service" "cloudbuild_api" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "sourcerepo_api" {
  project = var.project_id
  service = "sourcerepo.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "run_api" {
  project = var.project_id
  service = "run.googleapis.com"
  disable_on_destroy = false
}

# Cloud Build Trigger
resource "google_cloudbuild_trigger" "csr_trigger" {
  name        = "cloud-run-scaling-${var.environment}"
  description = "Build trigger for ${var.environment} environment"
  project     = var.project_id
  location    = var.region

  trigger_template {
    project_id  = var.project_id
    repo_name   = var.repository_name
    branch_name = var.branch_pattern
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

  depends_on = [
    google_project_service.cloudbuild_api,
    google_project_service.sourcerepo_api,
    google_project_service.run_api
  ]
}
