terraform {
  backend "remote" {
    organization = "personal-mobile"
    workspaces {
      name = "autopilot"
    }
  }
}

provider "google" {
  credentials = var.gcpcredentials
  project     = var.gcp_project_id
  region      = var.gcp_region
}


resource "google_container_cluster" "arcdemo" {
  name     = var.gke_cluster_name
  location = var.gcp_region
  
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  
  enable_autopilot = true
  
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.gcp_project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.gcp_project_id}-subnet"
  region        = var.gcp_region
  network       = google_compute_network.vpc.name
  #ip_cidr_range = "10.10.0.0/8"
}
