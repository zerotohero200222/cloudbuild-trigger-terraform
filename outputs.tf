output "trigger_id" {
  description = "Cloud Build Trigger ID"
  value       = google_cloudbuild_trigger.github_trigger.id
}

output "trigger_name" {
  description = "Trigger Name"
  value       = google_cloudbuild_trigger.github_trigger.name
}

output "repository" {
  description = "GitHub repository used"
  value       = var.repository_name
}

output "environment" {
  description = "Environment for the trigger"
  value       = var.environment
}

output "branch_pattern" {
  description = "Branch regex used for trigger"
  value       = var.branch_pattern
}

output "trigger_console_url" {
  value = "https://console.cloud.google.com/cloud-build/triggers;region=${var.region}/${google_cloudbuild_trigger.github_trigger.trigger_id}?project=${var.project_id}"
}

output "builds_console_url" {
  value = "https://console.cloud.google.com/cloud-build/builds?project=${var.project_id}"
}
