#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log() { echo "==> $*"; }

# AUR builds (makepkg) refuse to run as root
if [ "$EUID" -eq 0 ]; then
    echo "Error: run as a regular user with sudo access, not as root." >&2
    exit 1
fi

pkgs() { grep -Ev '^\s*(#|$)' "$SCRIPT_DIR/packages/$1"; }

# ── install ───────────────────────────────────────────────────────────────────

bootstrap() {
    log "Updating system..."
    sudo pacman -Syu --noconfirm

    log "Installing prerequisites..."
    sudo pacman -S --needed --noconfirm base-devel git chezmoi

    if ! command -v yay &>/dev/null; then
        log "Installing yay..."
        tmp=$(mktemp -d)
        git clone https://aur.archlinux.org/yay.git "$tmp/yay"
        (cd "$tmp/yay" && makepkg -si --noconfirm)
        rm -rf "$tmp"
    fi

    log "Installing packages..."
    pkgs dev.txt | xargs yay -S --needed --noconfirm
}

# ── setup ─────────────────────────────────────────────────────────────────────

setup_dotfiles() {
    log "Setting up dotfiles..."
    if [ ! -d "$HOME/.local/share/chezmoi/.git" ]; then
        chezmoi init sandyspiers
    fi
    chezmoi apply
}

install_tpm() {
    log "Installing TPM..."
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
}

create_dirs() {
    log "Creating ~/files/ directories..."
    for d in admin forks tools research projects scratch; do
        mkdir -p "$HOME/files/$d"
    done
}

setup_mirrors() {
    # no systemd (e.g. distrobox container) -> keep manual mirror-update only
    if [ ! -d /run/systemd/system ]; then
        log "No systemd; skipping reflector timer..."
        return
    fi

    log "Configuring reflector timer..."
    sudo tee /etc/xdg/reflector/reflector.conf >/dev/null <<'EOF'
--save /etc/pacman.d/mirrorlist
--country Australia
--protocol https
--sort rate
--latest 20
EOF
    sudo systemctl enable --now reflector.timer
    sudo systemctl start reflector.service
}

# ── main ──────────────────────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"

bootstrap
setup_dotfiles
install_tpm
create_dirs
setup_mirrors

log "Done!"
