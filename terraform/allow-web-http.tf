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
# terraform import google_compute_firewall.allow_web_http projects/ops-rahul-kumar/global/firewalls/allow-web-http
