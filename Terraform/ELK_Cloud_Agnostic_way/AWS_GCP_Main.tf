module "aws" {
  source = "../Modules/AWS" # Will overwrite below parameters in the aws_vars.tf file AWS folder
  ec2_instance_count = 1 # Number on ec2 instance
  PATH_TO_AWS_PUBLIC_KEY = var.aws_public_key # Public_key
  vpc_cidr = "192.168.0.0/16" # VPC CIDR Range
  tenancy  = "default"
  public_cidr_subnet = ["192.168.1.0/24","192.168.2.0/24"] # Public Subnets CIDR Range
  private_cidr_subnet = ["192.168.3.0/24","192.168.4.0/24"] # Private Subnets CIDR Range
  aws_instance_type = "t2.medium" # Instance type
}
module "gcp" {
  source = "../Modules/GCP" # Will overwrite below parameters in the gcp_vars.tf file GCP folder
  compute_instance_count = 1 # Number of Compute instances
  PATH_TO_GCP_PUBLIC_KEY = var.gcp_public_key # Public_key
  public_subnet_range = "10.1.0.0/20" # Public Subnetwork CIDR range
  private_subnet_range = "10.2.0.0/20" # Private Subnetwork CIDR range
  gcp_instance_type = "n1-standard-1" # Instance type
  instance_zone = "us-central1-a" # Region Name
}
#We can also varialize the above attributes like PATH_TO_GCP_PUBLIC_KEY
#Note: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html - CIDR selection AWS
#Note: https://cloud.google.com/vpc/docs/vpc - CIDR selection GCP
