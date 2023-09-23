output "project_id" {
  description = "Project ID."
  value = values(google_project_service.enabled)[0].project
  precondition {
    condition = length(toset(values(google_project_service.enabled)[*].project)) == 1
    error_message = "Services were enabled in multiple projects"
  }
}

output "services" {
  description = "Enabled services."
  value = google_project_service.enabled
}
