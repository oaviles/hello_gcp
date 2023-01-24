variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "gcpcredentials" {
  description = "GCP Project credentials filename"
  type        = string
}

variable "gcp_region" {
  description = "GCP region where resource will be created"
  type        = string
  default     = "us-central1" #us-west1
}

variable "cloudrun_name" {
  description = "GCP region where resource will be created"
  type        = string
  default     = "us-central1" #us-west1
}
