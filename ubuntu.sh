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
  if ! docker info &>/dev/null; then
    echo "Error: Docker is installed but not usable (daemon not running, or you lack permission)."
    echo "If it's a permission issue: sudo usermod -aG docker \$USER, then log out and back in."
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

  if ! command -v curl &>/dev/null; then
    echo "Error: curl is required. Install it with: sudo apt install curl"
    exit 1
  fi

  log "Installing Distrobox..."
  curl -fsSL https://raw.githubusercontent.com/89luca89/distrobox/main/install |
    sudo sh
}

create_arch_container() {
  # distrobox list prints "ID | NAME | ..." so match the NAME column exactly
  if distrobox list --no-color 2>/dev/null | awk -F'|' 'NR>1 {gsub(/ /,"",$2); print $2}' | grep -qx arch; then
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
log "Then bootstrap as normal: git clone https://github.com/sandyspiers/dotfiles.git && bash dotfiles/bootstrap.sh"
