# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"

# Starship prompt
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
