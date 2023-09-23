variable "project_id" {
  type = string
}

variable "project_devops_group" {
  type = string
}

variable "bucket_location" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "bucket_storage_class" {
  type = string
}

variable "service_account" {
  type = object({
    member = string,
  })
}
