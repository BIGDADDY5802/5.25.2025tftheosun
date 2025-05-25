#6-firewall.tf

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.cwglobal.name
  #direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"] # SSH
  }


  source_ranges = ["0.0.0.0/0"] #all traffic
}


resource "google_compute_firewall" "allow-web-traffic" {
  name    = "allow-web-traffic"
  network = google_compute_network.cwglobal.name
  #direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"] # allow-web-traffic
  }


  source_ranges = ["0.0.0.0/0"] #only this IP
}

resource "google_compute_firewall" "allow-ping" {
  name    = "allow-ping"
  network = google_compute_network.cwglobal.name
  #direction = "INGRESS"

  allow {
    protocol = "icmp"

  }


  source_ranges = ["0.0.0.0/0"] #all traffic
}
