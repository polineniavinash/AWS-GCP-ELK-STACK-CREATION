resource "google_compute_network" "new-vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  description             = "This module creates a VPC - if auto_create_subnetworks is set to true, a subnet for each reagion will be created automatically"
}

resource "google_compute_subnetwork" "public-subnet" {
  name          =  "us-public-net"
  ip_cidr_range = var.public_subnet_range
  network       = "${google_compute_network.new-vpc.self_link}"
  region        = "us-central1"
}
resource "google_compute_subnetwork" "private-subnet" {
  name          =  "ae-private-net"
  ip_cidr_range = var.private_subnet_range
  network       = "${google_compute_network.new-vpc.self_link}"
  region        = "asia-east1"
  private_ip_google_access  = true
}

resource "google_compute_firewall" "firewall1" {
  name    = "test-firewall"
  network = google_compute_network.new-vpc.name
  source_ranges = ["0.0.0.0/0","10.1.0.0/20"]
  target_tags = ["webserver"]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "5601", "9200"]
  }

  source_tags = ["web"]
}
resource "google_compute_instance" "gce" {
  count = var.compute_instance_count
  name         = "instance-${count.index + 1}"
  machine_type = var.gcp_instance_type
  zone         = var.instance_zone
  #network      = google_compute_network.default.self_link
  tags = ["webserver"]
  boot_disk {
    initialize_params {
      #image = data.google_compute_image.my_image.self_link
      image = "packer-elk-master"
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.public-subnet.self_link}"
    access_config {
      // Ephemeral IP

    }
  }
  metadata = {
   ssh-keys = "${var.gce_ssh_name}:${file(var.PATH_TO_GCP_PUBLIC_KEY)}"
  }
  provisioner "remote-exec" {
    connection {
       type     = "ssh"
       private_key = "${file(var.PATH_TO_GCP_PRIVATE_KEY)}"
       user = var.gce_ssh_name
       timeout = "500s"
       host = "${google_compute_instance.gce.*.network_interface.0.access_config.0.nat_ip[0]}"
     }
  inline = [
    "sudo chmod +x /etc/ansible/Terraform_ansible/gcp_ansible.sh",
    "bash /etc/ansible/Terraform_ansible/gcp_ansible.sh",
    "sleep 20",
  ]
  }
}
