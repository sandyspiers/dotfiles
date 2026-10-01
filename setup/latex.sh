#!/bin/bash
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

log "Installing LaTeX packages..."
pkgs latex.txt | xargs yay -S --needed --noconfirm

log "Done!"
