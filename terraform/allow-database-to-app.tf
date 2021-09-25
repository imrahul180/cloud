resource "google_compute_firewall" "allow_database_to_app" {
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  allow {
    protocol = "icmp"
  }

  direction   = "INGRESS"
  name        = "allow-database-to-app"
  network     = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/global/networks/network1-gdm"
  priority    = 1000
  project     = "ops-rahul-kumar"
  source_tags = ["database"]
  target_tags = ["app"]
}
# terraform import google_compute_firewall.allow_database_to_app projects/ops-rahul-kumar/global/firewalls/allow-database-to-app
