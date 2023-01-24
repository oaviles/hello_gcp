terraform {
  backend "remote" {
    # hostname     = "app.terraform.io"
    organization = "personal-mobile"
    workspaces {
      name = "poc_env"
    }
  }
}

provider "google" {
  #credentials = "${file("${var.credentials}")}"
  credentials = var.gcpcredentials
  project     = var.gcp_project_id
  region      = "us-central1"
}

resource "google_artifact_registry_repository" "my-repo" {
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}

