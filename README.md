# AWS-GCP-ELK-STACK-CREATION

Automate the Infrastructure as Code (IaC) setup of the ELK (Elasticsearch, Logstash, and Kibana) stack using Terraform, Packer, and Ansible on AWS and Google Cloud Platform (GCP).

## Overview

This project aims to simplify the deployment of the ELK stack on cloud platforms. It utilizes:
- **Terraform** for defining and provisioning the cloud infrastructure.
- **Packer** for creating consistent machine images.
- **Ansible** for configuring and managing the software on the cloud instances.

## Prerequisites

- An AWS Account
- A GCP Account
- [Terraform](https://www.terraform.io/downloads.html) installed
- [Packer](https://www.packer.io/downloads) installed
- [Ansible](https://www.ansible.com/) installed

## Getting Started

### Clone the Repository


git clone https://github.com/polineniavinash/AWS-GCP-ELK-STACK-CREATION.git
cd AWS-GCP-ELK-STACK-CREATION


### AWS Setup

Configure your AWS credentials:


export AWS_ACCESS_KEY_ID="<your_access_key>"
export AWS_SECRET_ACCESS_KEY="<your_secret_key>"

### GCP Setup

Set up GCP credentials:

export GOOGLE_CLOUD_KEYFILE_JSON="<path/to/your-keyfile.json>"

### Start

sh build.sh

## Customization

Customize the configurations by modifying the Terraform `.tf` files and the Ansible playbook as per your requirements.

## Contributing

Your contributions are welcome! For major changes, please open an issue first to discuss what you would like to change.

## Contact

Avinash Polineni - [@polineniavinash](https://github.com/polineniavinash)
