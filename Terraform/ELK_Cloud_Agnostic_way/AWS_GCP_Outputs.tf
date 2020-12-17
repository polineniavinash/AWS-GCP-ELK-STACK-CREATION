output "GCP_Region"{
  value = module.gcp.gcp_instance_region
}

output "GCP_compute_engine_IPV4_address"{
  value = module.gcp.public_ip_address
  description = "The IPv4 address of the compute instance"
}

output "AWS_region" {
  value = module.aws.aws_instance_region
}

output "AWS_ec2_Instance_IPV4_address" {
  value = module.aws.public_ip_address
}
