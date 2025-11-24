output "trigger_id" {
  value       = google_cloudbuild_trigger.csr_trigger.id
  description = "Cloud Build Trigger ID"
}

output "trigger_name" {
  value       = google_cloudbuild_trigger.csr_trigger.name
}

output "environment" {
  value = var.environment
}

output "branch_pattern" {
  value = var.branch_pattern
}

output "repository" {
  value = var.repository_name
}

output "service_account" {
  value = var.service_account_email
}
