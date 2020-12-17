#!/bin/bash

cd Terraform/ELK_Cloud_Agnostic_way #Will change the directory to ELK_Cloud_Agnostic_way folder

#terraform import aws_ami.example - This command will help to import the existed AWS AMI to statefile and later destroys it

terraform destroy --auto-approve #Will deprovision the infrastructure depending up on the .tf files.
