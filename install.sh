#!/bin/bash
set -euo pipefail

TARGET="${1:-localhost}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_ansible() {
    if command -v ansible-playbook &>/dev/null; then
        echo "==> Ansible already installed"
        return
    fi

    if [ ! -f /etc/os-release ]; then
        echo "==> Cannot detect OS: /etc/os-release not found"
        exit 1
    fi
    . /etc/os-release

    if [ "${ID}" = "arch" ] || echo "${ID_LIKE:-}" | grep -q "arch"; then
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
}

install_dependencies() {
    echo "==> Installing Ansible collections..."
    ansible-galaxy collection install -r "${SCRIPT_DIR}/ansible/requirements.yml"
}

run_playbook() {
    echo "==> Running playbook (target: ${TARGET})..."
    cd "${SCRIPT_DIR}/ansible"
    ansible-playbook main.yml --ask-become-pass -e target="${TARGET}"
}

install_ansible
install_dependencies
run_playbook

echo "==> Done!"
