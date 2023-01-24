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
  description = "Cloud Run Service Name"
  type        = string
  default     = "oacloudrun01" #us-west1
}

variable "gar_name" {
  description = "Google Artifact Registry Service Name"
  type        = string
  default     = "oagar01" #us-west1
}
