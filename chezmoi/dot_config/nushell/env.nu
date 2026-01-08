# This file exists so that when I do
# nu -c "..."
# we have the correct environment variables

# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"
$env.JULIA_SHELL = "bash"

# add localbin
$env.PATH = ($env.PATH | prepend "/home/sandy/.local/bin")

