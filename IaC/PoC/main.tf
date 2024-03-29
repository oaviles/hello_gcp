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
  location      = var.gcp_region
  repository_id = var.gar_name
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

resource "google_cloud_run_service_iam_binding" "default" {
  location = google_cloud_run_service.default.location
  service  = google_cloud_run_service.default.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}
