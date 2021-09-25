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
  required_version = "0.12.31"

  backend "gcs" {
    bucket = "1252957-tfstate"
    prefix = "mgcp-1252957-omg-stage"
  }
}

data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket = "1252957-tfstate"
    prefix = "ops-rahul-kumar"
  }
}