# outputs.tf

output "trigger_id" {
  description = "ID of the Cloud Build trigger"
  value       = google_cloudbuild_trigger.csr_trigger.id
}

output "trigger_name" {
  description = "Name of the trigger"
  value       = google_cloudbuild_trigger.csr_trigger.name
}

output "repository" {
  description = "CSR repository name"
  value       = var.repository_name
}

output "service_account" {
  description = "Service account used by Cloud Build"
  value       = var.service_account_email
}

output "environment" {
  description = "Environment this trigger belongs to"
  value       = var.environment
}

output "branch_pattern" {
  description = "Branch to trigger on"
  value       = var.branch_pattern
}

output "trigger_console_url" {
  description = "URL to view trigger in GCP Console"
  value       = "https://console.cloud.google.com/cloud-build/triggers;region=${var.region}/${google_cloudbuild_trigger.csr_trigger.trigger_id}?project=${var.project_id}"
}

output "builds_console_url" {
  description = "URL to view builds in GCP Console"
  value       = "https://console.cloud.google.com/cloud-build/builds?project=${var.project_id}"
}
