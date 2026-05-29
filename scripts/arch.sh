arch_bootstrap() {
    log "Updating system..."
    sudo pacman -Syu --noconfirm

    log "Installing prerequisites..."
    sudo pacman -S --needed --noconfirm base-devel git mise chezmoi

    if ! command -v yay &>/dev/null; then
        log "Installing yay..."
        tmp=$(mktemp -d)
        git clone https://aur.archlinux.org/yay.git "$tmp/yay"
        (cd "$tmp/yay" && makepkg -si --noconfirm)
        rm -rf "$tmp"
    fi

    log "Installing packages..."
    grep -Ev '^\s*(#|$)' "$SCRIPT_DIR/packages/arch.txt" | \
        xargs yay -S --needed --noconfirm
}
