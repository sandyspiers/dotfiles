#!/bin/bash

# early exit if we fail...
set -e

echo "==> Installing/updating Ansible..."
sudo pacman -S --noconfirm ansible

echo "==> Running Ansible playbook..."
cd ansible
ansible-playbook main.yml

echo "==> Done!"
