# List of bucket goes here to store the object data based on business requirement

resource "google_storage_bucket" "resource-name" {
  name          = "bucket-name"
  location      = "location"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}
