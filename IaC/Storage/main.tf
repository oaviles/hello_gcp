provider "google" {
  project = "${var.project}"
  region  = "us-central1"
}

resource "google_storage_bucket" "bucket" {
  name     = "oa-lab-bucket"
  location = "US"
}
