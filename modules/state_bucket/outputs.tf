output "project_id" {
  description = "Project ID."
  value = google_storage_bucket.main.project
}

output "bucket" {
  description = "Terraform remote state bucket."
  value = google_storage_bucket.main
}
