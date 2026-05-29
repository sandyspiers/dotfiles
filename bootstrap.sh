#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log() { echo "==> $*"; }

detect_os() {
    [ -f /etc/os-release ] || { echo "Cannot detect OS: /etc/os-release not found" >&2; exit 1; }
    . /etc/os-release
    case "${ID}" in
        arch)          OS="arch" ;;
        ubuntu|debian) OS="ubuntu" ;;
        *)
            if echo "${ID_LIKE:-}" | grep -q "arch"; then OS="arch"
            elif echo "${ID_LIKE:-}" | grep -qE "ubuntu|debian"; then OS="ubuntu"
            else echo "Unsupported OS: ${ID}" >&2; exit 1
            fi
            ;;
    esac
}

. "$SCRIPT_DIR/scripts/chezmoi.sh"
. "$SCRIPT_DIR/scripts/mise.sh"
. "$SCRIPT_DIR/scripts/julia.sh"
. "$SCRIPT_DIR/scripts/tmux.sh"
. "$SCRIPT_DIR/scripts/dirs.sh"

detect_os
export PATH="$HOME/.local/bin:$HOME/.juliaup/bin:$PATH"

case "$OS" in
    arch)
        . "$SCRIPT_DIR/scripts/arch.sh"
        arch_bootstrap
        ;;
    ubuntu)
        . "$SCRIPT_DIR/scripts/ubuntu.sh"
        ubuntu_bootstrap
        ;;
esac

setup_dotfiles
run_mise
setup_julia
install_tpm
create_dirs

log "Done!"
