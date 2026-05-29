create_dirs() {
    log "Creating ~/files/ directories..."
    for d in admin forks tools research projects scratch; do
        mkdir -p "$HOME/files/$d"
    done
}
