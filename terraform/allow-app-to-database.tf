resource "google_compute_firewall" "allow_app_to_database" {
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  allow {
    protocol = "icmp"
  }

  direction   = "INGRESS"
  name        = "allow-app-to-database"
  network     = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/global/networks/network1-gdm"
  priority    = 1000
  project     = "ops-rahul-kumar"
  source_tags = ["web"]
  target_tags = ["database"]
}
# terraform import google_compute_firewall.allow_app_to_database projects/ops-rahul-kumar/global/firewalls/allow-app-to-database
