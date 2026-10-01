#!/bin/bash
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

log "Setting up Julia..."
juliaup add release
julia -e 'using Pkg
    Pkg.Apps.add(url="https://github.com/aviatesk/JETLS.jl", rev="release")
    Pkg.Apps.add(["JuliaFormatter", "Runic"])'

log "Done!"
