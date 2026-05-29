#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log() { echo "==> $*"; }

log "Installing LaTeX packages..."
grep -Ev '^\s*(#|$)' "$SCRIPT_DIR/packages/latex.txt" | \
    xargs yay -S --needed --noconfirm

log "Done!"
