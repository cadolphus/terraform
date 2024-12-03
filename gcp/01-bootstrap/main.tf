######################
## TERRAFORM CONFIG ##
######################

terraform {
  backend "gcs" {
    bucket      = var.gcs_tf_state_bucket
    prefix      = "terraform/state/level-0/gcp-bootstrap"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>6.12.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~>6.12.0"
    }
  }
}

#####################
## PROVIDER CONFIG ##
#####################

provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}

provider "google-beta" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}

###################
## RANDOM PREFIX ##
###################

# Generate a random string to use as a resource prefix to ensure uniqueness
resource "random_id" "prefix" {
  byte_length = 1
}
locals {
  prefix = random_id.prefix.hex
}
# Create an output variable of this random prefix so it can be referenced/used by other modules
output "rand_prefix_hex" {
  value = local.prefix
}
