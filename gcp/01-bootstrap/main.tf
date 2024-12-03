######################
## TERRAFORM CONFIG ##
######################

terraform {
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

#########
## VPC ##
#########

# Create an empty VPC network (without any subnets, routes, or firewall rules)
resource "google_compute_network" "vpc" {
  name                    = "tf${local.prefix}-${var.vpc_name}"
  description             = "Created via Infrastructure Manager"
  auto_create_subnetworks = false
  routing_mode            = var.vpc_routing_mode
  mtu                     = var.vpc_mtu
}
# Create output variables of the VPC so it can be referenced/used by other modules
output "vpc_name" {
  value = google_compute_network.vpc.name
}
output "vpc_id" {
  value = google_compute_network.vpc.id
}

#############
## SUBNETS ##
#############

# Create all subnets by using the for_each operator to iterate through the vpc_subnets variable map
resource "google_compute_subnetwork" "subnets" {
  for_each                 = var.vpc_subnets

  name                     = "tf${local.prefix}-${each.key}"
  description              = "Created via Infrastructure Manager"
  ip_cidr_range            = each.value["ip_cidr_range"]
  region                   = each.value["region"]
  network                  = google_compute_network.vpc.id
  private_ip_google_access = each.value["private_ip_google_access"]
}

# Create an output variable of the subnets so they can be referenced/used by other modules
output "all_subnets" {
  value = google_compute_subnetwork.subnets
}
