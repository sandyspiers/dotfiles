#!/bin/bash

# early exit if we fail...
set -e

if command -v ansible-playbook &> /dev/null; then
    echo "==> Ansible is already installed"
else
    echo "==> Installing Ansible..."
    sudo pacman -S --noconfirm ansible
fi

if command -v yay &> /dev/null; then
    echo "==> yay is already installed"
else
    echo "==> Installing yay..."
    sudo pacman -S --noconfirm --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
fi

echo "==> Running Ansible playbook..."
cd ansible
ansible-galaxy collection install -r requirements.yml
ansible-playbook main.yml --ask-become-pass

echo "==> Done!"
