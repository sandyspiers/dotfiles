#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log() { echo "==> $*"; }

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
}

create_dirs() {
    log "Creating ~/files/ directories..."
    for d in admin forks tools research projects scratch; do
        mkdir -p "$HOME/files/$d"
    done
}

# ── main ──────────────────────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"

bootstrap
setup_dotfiles
install_tpm
create_dirs

log "Done!"
