#!/bin/bash
cd packer/ #Will change the directory to packer folder

packer build gcp-example.json & #Will take a base images and build the customized image based on .json file
packer build aws-example.json #Will take a base AMI and build the customized AMI based on .json file

sleep 1m #Will wait for 1 minute to execute the remaining commands

cd ../Terraform/ELK_Cloud_Agnostic_way #Will change the directory to ELK_Cloud_Agnostic_way folder
terraform init #Will install the required plugins depending on the providers and backends

terraform apply --auto-approve #Will provision the infrastructure depending up on the .tf files.
