# Web instance

resource "google_compute_instance" "web_instance" {
  attached_disk {
    device_name = "data-disk"
    mode        = "READ_WRITE"
    source      = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/zones/us-central1-a/disks/data-disk"
  }

  boot_disk {
    auto_delete = true
    device_name = "instance-1"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-10-buster-v20210916"
      size  = 10
      type  = "pd-balanced"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/zones/us-central1-a/disks/instance-1"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  deletion_protection = true

  labels = {
    tier            = "web"
    managed-by-cnrm = "true"
  }

  machine_type = "e2-custom-2-1024"
  name         = "web-instance"

  network_interface {
    access_config {
      nat_ip       = "34.122.129.109"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/global/networks/network1-gdm"
    network_ip         = "192.161.0.6"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/regions/us-central1/subnetworks/services"
    subnetwork_project = "ops-rahul-kumar"
  }

  project = "ops-rahul-kumar"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = "114595439095-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  tags = ["web"]
  zone = "us-central1-a"
}

# App instance

resource "google_compute_instance" "app_instance" {
  attached_disk {
    device_name = "disk-app"
    mode        = "READ_WRITE"
    source      = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/zones/us-central1-a/disks/disk-app"
  }

  boot_disk {
    auto_delete = true
    device_name = "app-instance"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-10-buster-v20210916"
      size  = 10
      type  = "pd-balanced"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/zones/us-central1-a/disks/app-instance"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  deletion_protection = true

  labels = {
    managed-by-cnrm = "true"
    tier            = "app"
  }

  machine_type = "e2-custom-2-1024"
  name         = "app-instance"

  network_interface {
    network            = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/global/networks/network1-gdm"
    network_ip         = "192.168.0.49"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/regions/us-central1/subnetworks/subnet-1"
    subnetwork_project = "ops-rahul-kumar"
  }

  project = "ops-rahul-kumar"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = "114595439095-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  tags = ["app"]
  zone = "us-central1-a"
}

# Database Instance

resource "google_compute_instance" "database_instance" {
  attached_disk {
    device_name = "database-data-disk"
    mode        = "READ_WRITE"
    source      = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/zones/us-central1-a/disks/database-data-disk"
  }

  boot_disk {
    auto_delete = true
    device_name = "database-instance"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-10-buster-v20210916"
      size  = 10
      type  = "pd-balanced"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/zones/us-central1-a/disks/database-instance"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  deletion_protection = true

  labels = {
    tier            = "database"
    managed-by-cnrm = "true"
  }

  machine_type = "e2-custom-2-1024"
  name         = "database-instance"

  network_interface {
    network            = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/global/networks/network1-gdm"
    network_ip         = "192.161.0.7"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/ops-rahul-kumar/regions/us-central1/subnetworks/services"
    subnetwork_project = "ops-rahul-kumar"
  }

  project = "ops-rahul-kumar"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = "114595439095-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  tags = ["database"]
  zone = "us-central1-a"
}
