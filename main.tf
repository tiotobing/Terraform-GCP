provider "google" {
	credentials = "${file("credx.json")}"
	project = "useful-approach-236817"
	region = "asia-southeast1"
	zone = "asia-southeast1-b"
}

resource "google_compute_instance" "vm_instance" {
	name = "terraform-instance1"
	machine_type = "f1-micro"

	boot_disk {
	   initialize_params {
	     image = "ubuntu-1804-lts"
           }
        }
        network_interface {
           network = "${google_compute_network.vpc_network.self_link}"
	   access_config{
           }
        }
}

resource "google_compute_network" "vpc_network" {
       name  = "terraform-network"
       auto_create_subnetworks = "true"
}
