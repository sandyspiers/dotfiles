setup_dotfiles() {
    log "Setting up dotfiles..."
    if [ ! -d "$HOME/.local/share/chezmoi/.git" ]; then
        chezmoi init sandyspiers
    fi
    chezmoi apply
}
