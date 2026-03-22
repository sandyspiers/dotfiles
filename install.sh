#!/bin/bash
set -e

# Parse level argument
LEVEL="${1:-dev}"
if [[ ! "$LEVEL" =~ ^(minimal|dev|full)$ ]]; then
    echo "Usage: $0 [minimal|dev|full]"
    echo "Default: dev"
    exit 1
fi

# Detect OS via /etc/os-release
if [ -f /etc/os-release ]; then
    . /etc/os-release
else
    echo "==> Cannot detect OS: /etc/os-release not found"
    exit 1
fi

# Install Ansible if not present
if command -v ansible-playbook &>/dev/null; then
    echo "==> Ansible is already installed"
elif [ "${ID}" = "arch" ] || echo "${ID_LIKE}" | grep -q "arch"; then
    echo "==> Installing Ansible (pacman)..."
    sudo pacman -S --noconfirm ansible
elif [ "${ID}" = "ubuntu" ] || [ "${ID}" = "debian" ]; then
    echo "==> Installing Ansible (pip)..."
    sudo apt-get update -qq
    sudo apt-get install -y python3-pip
    pip3 install --user ansible
    export PATH="$HOME/.local/bin:$PATH"
else
    echo "==> Unsupported OS: ${ID}"
    exit 1
fi

echo "==> Running Ansible playbook (level: ${LEVEL})..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}/ansible"
ansible-galaxy collection install -r requirements.yml
ansible-playbook main.yml --ask-become-pass -e level="${LEVEL}"

echo "==> Done!"
