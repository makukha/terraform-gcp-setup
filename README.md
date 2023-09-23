# terraform-gcp-setup

Terraform module to setup Google Cloud Platform service account and backend bucket.

This module requires:

1. Existing Google Cloud project with billing enabled.
2. Google account that has owner permissions to this project.
3. IAM group that will be granted permissions to impersonate service account.

This module:

1. Creates service account with minimal permissions.
2. Creates storage bucket with admin permissions granted to both new service account and project owner account.
3. Grants permissions to impersonate srvice account to IAM group.
4. Enables Google Cloud services necessary to run steps above.


## Simple usage

See also `examples/full`.

1. [Install Google Cloud CLI](https://cloud.google.com/sdk/docs/install-sdk)

2. Authenticate to Google Cloud and create application default credentials:

    ```bash
    gcloud auth login 
    gcloud auth application-default login
    ```

3. Create sample project:

    ```bash
    gcloud projects create --name="Sample project"
    ```

   Note the generated project id, it will be referenced as `${PROJECT_ID}` below.

4. [Enable billing](https://cloud.google.com/billing/docs/how-to/modify-project#enable_billing_for_a_project) for the project `${PROJECT_ID}`

5. Create IAM group and add yourself to the group. Note the group name, it will be referenced below as `${PROJECT_DEVOPS_GROUP}`.

6. Create root module files:

    * `main.tf`

        ```hcl-terraform
        provider "google" {}

        terraform {
          backend "local" {}
        }

        module "setup" {
          source = "github.com/makukha/terraform-gcp-setup"
          project_id = "${PROJECT_ID}"
          project_devops_group = "${PROJECT_DEVOPS_GROUP}"
          state_bucket_location = "europe-west1"
          state_bucket_name = "${PROJECT_ID}-tfstate"
        }
        ```

    * `outputs.tf`

        ```hcl-terraform
        output "all" {
          value = module.setup
        }
        ```

7. Init, check, apply, see outputs:

    ```bash
    terraform init
    terraform plan
    terraform apply
    ```
