#!/bin/bash
set -euo pipefail

log() { echo "==> $*"; }

# ── docker ────────────────────────────────────────────────────────────────────

check_docker() {
    if ! command -v docker &>/dev/null; then
        echo "Error: Docker is not installed."
        echo "Install it from https://docs.docker.com/engine/install/ubuntu/ then re-run this script."
        exit 1
    fi
    log "Docker found."
}

# ── distrobox ─────────────────────────────────────────────────────────────────

install_distrobox() {
    if command -v distrobox &>/dev/null; then
        log "Distrobox already installed, skipping..."
        return
    fi

    log "Installing Distrobox..."
    curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install \
        | sudo sh
}

create_arch_container() {
    if distrobox list 2>/dev/null | grep -q "^arch"; then
        log "Arch container already exists, skipping..."
        return
    fi

    log "Creating Arch container..."
    distrobox create --image archlinux --name arch
}

# ── main ──────────────────────────────────────────────────────────────────────

check_docker
install_distrobox
create_arch_container

log "Done! Enter the container with: distrobox enter arch"
log "Then bootstrap as normal: git clone https://github.com/sandyspiers/chezmoi.git && bash chezmoi/bootstrap.sh"
