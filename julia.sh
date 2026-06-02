#!/bin/bash
set -euo pipefail

export PATH="$HOME/.local/bin:$HOME/.juliaup/bin:$PATH"

log() { echo "==> $*"; }

log "Setting up Julia..."
juliaup add release
julia-app --url https://github.com/aviatesk/JETLS.jl --rev release
julia-app JuliaFormatter Runic

log "Done!"
