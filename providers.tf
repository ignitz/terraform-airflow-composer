provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

terraform {
  required_providers {
    google = {
      version = "~> 3.87.0"
    }
    google-beta = {
      version = "~> 3.87.0"
    }
  }
}
