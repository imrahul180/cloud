provider "google" {
  project = ops-rahul-kumar
  region  = us-central1
  version = "3.73"
}

provider "google-beta" {
  project = ops-rahul-kumar
  region  = us-central1
  version = "3.73"
}

terraform {
  required_version = "1.12.31"

  backend "gcs" {
    bucket = "12345-tfstate"
    prefix = "project-name"
  }
}

data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket = "1252957-tfstate"
    prefix = "ops-rahul-kumar"
  }
}
