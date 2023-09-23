resource "google_project_service" "enabled" {
  for_each = toset(
    [
      "cloudresourcemanager.googleapis.com",
      "iam.googleapis.com",
      "serviceusage.googleapis.com",
      "storage.googleapis.com",
    ]
  )
  service = each.key
  project = var.project_id
  disable_on_destroy = false
}
