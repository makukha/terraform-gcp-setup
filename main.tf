terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

module "project_services" {
  source = "./modules/project_services"
  project_id = var.project_id
}

module "service_account" {
  source = "./modules/service_account"
  project_id = var.project_id
  project_devops_group = var.project_devops_group
  service_account_id = var.service_account_id
  service_account_roles = var.service_account_roles

  depends_on = [
    module.project_services,
  ]
}

module "state_bucket" {
  source = "./modules/state_bucket"
  project_id = var.project_id
  project_devops_group = var.project_devops_group
  bucket_location = var.state_bucket_location
  bucket_name = var.state_bucket_name
  bucket_storage_class = var.state_bucket_storage_class
  service_account = module.service_account.service_account

  depends_on = [
    module.project_services,
  ]
}
