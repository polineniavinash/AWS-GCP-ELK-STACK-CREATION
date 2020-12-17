variable "aws_region" {
  default = "us-east-2"
}

variable "PATH_TO_AWS_PRIVATE_KEY" {
  default = "aws_private_key"
}

variable "PATH_TO_AWS_PUBLIC_KEY" {
  #default = "aws_public_key.pub"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ec2_instance_count" {
  default = 1
}
variable "tenancy" {
  default = "default"
}

variable "dns_support" {
  default = "true"
}

variable "dns_hostnames" {
  default = "true"
}

variable "classiclink" {
  default = "false"
}

variable "public_ip_mapping" {
  default = "true"
}

variable "public_cidr_subnet" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr_subnet" {
  type    = "list"
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "aws_instance_type" {
  default = "t2.medium"
}
variable "aws_ssh_name" {
  default = "ubuntu"
}
data "aws_availability_zones" "azs" {}
