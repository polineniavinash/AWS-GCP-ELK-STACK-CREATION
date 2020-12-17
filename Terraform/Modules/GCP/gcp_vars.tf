variable "gcp_project_name" {
  default = "myfirst-256611"
  description = "Project on which you want to deploy the ELK-Stack"
}
variable "vpc_name" {
  description = "VPC Name"
  default = "myvpc"
}

variable "auto_create_subnetworks" {
  default     = "false"
  description = "false = creates custom VPC, true = automatically creates subnets in each region"
}

variable "compute_instance_count" {
  default = 1
}
variable "public_subnet_range" {
  default = "10.1.0.0/20"
}
variable "private_subnet_range" {
  default = "10.2.0.0/20"
}
variable "gcp_instance_type" {
  default = "n1-standard-1"
  description = "Instance type"
}
variable "instance_zone" {
  default = "us-central1-a"
  description = "Instance location"
}
variable "PATH_TO_GCP_PRIVATE_KEY" {
  default = "gcp_private_key"
}
variable "PATH_TO_GCP_PUBLIC_KEY" {
  #default = "gcp_public_key.pub"
}
variable "gce_ssh_name" {
  default = "ubuntu"
}
