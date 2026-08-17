# Loaded by interactive/login shells (nu -l); note plain `nu -c` skips this file

# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "nvim"
$env.JULIA_SHELL = "bash"

# PATH is managed here and only here (nu is the single source of truth);
# uniq keeps nested shells from stacking duplicates
$env.PATH = ($env.PATH
    | prepend "/usr/bin/vendor_perl"     # perl (mostly just for biber)
    | prepend $"($env.HOME)/.julia/bin"  # julia apps (jetls, runic)
    | prepend $"($env.HOME)/.local/bin"  # own scripts
    | uniq)

