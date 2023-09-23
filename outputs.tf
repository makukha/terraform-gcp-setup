output "project_id" {
  description = "Project ID."
  value = module.service_account.project_id
}

output "project_services" {
  description = "Enabled project services."
  value = module.project_services.services
}

output "service_account" {
  description = "Terraform service account."
  value = module.service_account.service_account
}

output "service_account_roles" {
  description = "Roles of the Terraform service account."
  value = module.service_account.service_account_roles
}

output "state_bucket" {
  description = "Terraform remote state bucket."
  value = module.state_bucket.bucket
}
