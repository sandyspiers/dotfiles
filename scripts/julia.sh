setup_julia() {
    log "Setting up Julia..."
    juliaup add release
    julia-app --url https://github.com/aviatesk/JETLS.jl --rev release
    julia-app JuliaFormatter Runic
}
