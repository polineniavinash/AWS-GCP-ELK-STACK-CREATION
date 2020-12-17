#!/bin/bash
ansible-playbook /etc/ansible/Terraform_ansible/site.yml --extra-vars "version=1.23.45 var_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)"
