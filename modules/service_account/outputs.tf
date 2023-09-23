output "project_id" {
  description = "Project ID."
  value = google_service_account.main.project
}

output "service_account" {
  description = "Terraform service account."
  value = google_service_account.main
}

output "service_account_roles" {
  description = "Roles of the Terraform service account."
  value = google_project_iam_member.role
}
