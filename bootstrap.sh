#!/bin/bash

echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  software-properties-common \
  ansible-core

echo "Installing Ansible Galaxy dependencies..."
ansible-galaxy install -r requirements.yml

echo "Done."
