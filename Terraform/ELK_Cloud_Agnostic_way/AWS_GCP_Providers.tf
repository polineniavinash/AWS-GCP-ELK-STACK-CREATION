provider "aws" {
  region = var.aws_region
}
provider "google" {
  credentials = "${file("C:\\Users\\Administrator\\Desktop\\Avinash\\GCP\\account.json")}"
  project     = var.gcp_project_name
}
