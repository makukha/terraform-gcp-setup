provider "google" {}

terraform {
  backend "local" {}
}

module "setup" {
  source = "../../../terraform-gcp-setup"  # for local testing
  #source = "github.com/makukha/terraform-gcp-setup"  # for use in real configurations
  project_id = var.project_id
  state_bucket_location = "europe-west1"
  state_bucket_name = "${var.project_id}-tfstate"
}
