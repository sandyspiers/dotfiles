# Shared helpers; sourced by the setup scripts, not run directly.

SETUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log() { echo "==> $*"; }

# Package names from packages/<file>, skipping comments and blank lines
pkgs() { grep -Ev '^\s*(#|$)' "$SETUP_DIR/packages/$1"; }
