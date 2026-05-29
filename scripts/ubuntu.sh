ubuntu_bootstrap() {
    log "Updating system..."
    sudo apt-get update -qq
    sudo apt-get upgrade -y

    log "Installing packages..."
    grep -Ev '^\s*(#|$)' "$SCRIPT_DIR/packages/ubuntu.txt" | \
        xargs sudo apt-get install -y

    if ! command -v mise &>/dev/null; then
        log "Installing mise..."
        curl https://mise.run | sh
    fi

    if ! command -v chezmoi &>/dev/null; then
        log "Installing chezmoi..."
        curl -sfL https://get.chezmoi.io | sh -s -- -b "$HOME/.local/bin"
    fi

    if ! command -v juliaup &>/dev/null; then
        log "Installing juliaup..."
        curl -fsSL https://install.julialang.org | sh -s -- --yes
    fi
}
