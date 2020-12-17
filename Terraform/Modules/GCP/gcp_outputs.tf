output "gcp_instance_region"{
  value = var.instance_zone
}
# output "name" {
#   value       = "${google_compute_network.new-vpc.name}"
#   description = "The unique name of the network"
# }

output "public_ip_address" {
  value       = "${google_compute_instance.gce.*.network_interface.0.access_config.0.nat_ip}"
  description = "The IPv4 address of the compute instance"
}
