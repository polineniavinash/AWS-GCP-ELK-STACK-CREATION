variable "aws_region" {
  default = "us-east-2"
}

variable "gcp_project_name" {
  default = "myfirst-256611"
  description = "Project on which you want to deploy the ELK-Stack"
}

variable "aws_public_key" {
  default = "aws_public_key.pub"
}

variable "PATH_TO_AWS_PRIVATE_KEY" {
  default = "aws_private_key"
}

variable "gcp_public_key" {
  default = "gcp_public_key.pub"
}

variable "PATH_TO_GCP_PRIVATE_KEY" {
  default = "gcp_private_key"
}
