#!/bin/bash -eux

# Install Ansible repository.
apt -y update && apt-get -y upgrade
apt -y install software-properties-common
apt-add-repository ppa:ansible/ansible -y

# Install Ansible.
apt -y update
apt -y install ansible
