# This file just declares the names, types, and default values for the variables used in the main.tf script.
# To set the values of these variables, do that in the "terraform.tfvars" file in the same directory.

# GCP parameters
variable "gcp_project_id" {
  type = string
  description = "Enter the GCP Project ID only - do *NOT* use the Project Name or the Project Number"
}
variable "gcp_region" {
  type = string
  description = "Enter the default GCP region to use for this script - Eg: australia-southeast1"
}
variable "gcp_zone" {
  type = string
  description = "Enter the default GCP zone to use for this script - Eg: australia-southeast1-b"
}
variable "vpc_name" {
  type = string
  description = "Enter the name to use when creating the VPC Network for this bootstrap - Eg: vpc-dev"
}
variable "vpc_routing_mode" {
  type = string
  description = "Enter the routing mode to use for this VPC - either 'GLOBAL' or 'REGIONAL'"
  default = "GLOBAL"
}
variable "vpc_mtu" {
  type = number
  description = "Enter the MTU to use for this VPC - between 1460 and 1500 inclusive. If set to 0 (meaning MTU is unset), the network will default to 1460 automatically."
  default = 0
}
variable "vpc_subnets" {
  description = "Enter all the VPC subnets as a list of objects, each of which contain only strings"
}
