
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
