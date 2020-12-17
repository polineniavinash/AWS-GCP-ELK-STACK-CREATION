#!/bin/bash
ansible-playbook /etc/ansible/Terraform_ansible/site.yml --extra-vars "version=1.23.45 var_ip=$(curl -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip)"
