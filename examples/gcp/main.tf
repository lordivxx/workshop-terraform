provider "google" {
  version = "3.5.0"

  credentials = file("~/terraform-ccabb4d682e8.json")

  project = "terraform-272703"
  region  = "us-west1"
  zone    = "us-west1-a"
}

#resource "google_compute_project_metadata_item" "ssh-keys" {
#  key   = "ssh-keys"
#  value = "${var.public_key_path}"
#}

resource "google_compute_network" "terraform-network" {
  name = "terraform-network"
}

resource "google_compute_subnetwork" "workshop-subnet" {
  name          = "workshop-subnet"
  ip_cidr_range = "10.4.20.0/24"
  network       = google_compute_network.terraform-network.self_link
  region        = "us-west1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance${count.index}"
  machine_type = "f1-micro"
  count        = var.thecount

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.workshop-subnet.self_link
    access_config {
    }
  }

  metadata = {
    ssh-keys = "chuck_forsyth:${file(var.public_key_path)}"
  }

  provisioner "local-exec" {
    command = "echo google_compute_instance.terraform-instance${count.index}.public_ip >> ip_address.txt"
  }

  depends_on = [google_compute_network.terraform-network,google_compute_subnetwork.workshop-subnet]

}

resource "google_compute_firewall" "all-inbound" {
  name    = "all-inbound"
  network = google_compute_network.terraform-network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "all-outbound" {
  name    = "all-outbound"
  network = google_compute_network.terraform-network.name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}

