#!/bin/bash -eux

# Install Ansible repository.
sudo apt -y update && sudo apt-get -y upgrade
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible

# Install Ansible.
sudo apt -y update
sudo apt -y install ansible
