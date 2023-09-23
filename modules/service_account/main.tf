resource "google_service_account" "main" {
  account_id = var.service_account_id
  project = var.project_id
}

resource "google_project_iam_member" "role" {
  for_each = toset(var.service_account_roles)
  role = each.value
  member = google_service_account.main.member  # yes, there is a "member" attribute
  project = var.project_id
}
