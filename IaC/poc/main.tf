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
  region      = var.gcp_region
}

resource "google_artifact_registry_repository" "my-repo" {
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}

resource "google_cloud_run_service" "default" {
  name     = var.cloudrun_name
  location = var.gcp_region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
