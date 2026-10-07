#!/bin/bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y ansible-core git openssh-server rsync
ansible-galaxy collection install -r requirements.yml
