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

resource "google_compute_firewall" "allow_web_http" {
  allow {
    ports    = ["80", "443"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "allow-web-http"
  network       = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/global/networks/network1-gdm"
  priority      = 1000
  project       = "ops-rahul-kumar"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}

resource "google_compute_firewall" "deny_egress_from_database_to_app" {
  deny {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0", "192.168.0.49"]
  direction          = "EGRESS"
  name               = "deny-egress-from-database-to-app"
  network            = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/global/networks/network1-gdm"
  priority           = 1000
  project            = "ops-rahul-kumar"
  target_tags        = ["database"]
}
