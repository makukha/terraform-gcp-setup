resource "google_storage_bucket" "main" {
  name = var.bucket_name
  location = var.bucket_location
  storage_class = var.bucket_storage_class
  public_access_prevention = "enforced"
  uniform_bucket_level_access = true
  project = var.project_id
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_storage_bucket_iam_member" "main" {
  for_each = {
    service_account = var.service_account.member,
    project_owner = "projectOwner:${var.project_id}",
  }
  bucket = google_storage_bucket.main.name
  role = "roles/storage.admin"
  member = each.value
}
