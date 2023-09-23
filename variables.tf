# Project settings

variable "project_id" {
  description = "GCP project id, must already exist."
  type = string
}

variable "labels" {
  description = "A map of labels to apply to contained resources."
  type = map(string)
  default = {}
}

# Terraform service account

variable "service_account_id" {
  description = "Terraform service account id."
  type = string
  default = "terraform"
}

variable "service_account_roles" {
  description = "Additional roles for Terraform service account."
  type = list(string)
  default = []
}

# Terraform remote state bucket

variable "state_bucket_location" {
  description = "Terraform state bucket location."
  type = string
}

variable "state_bucket_name" {
  description = "Terraform state bucket name."
  type = string
}

variable "state_bucket_storage_class" {
  description = "Terraform state bucket storage class."
  type = string
  default = "REGIONAL"
}
