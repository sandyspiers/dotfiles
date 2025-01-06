# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"

# Zoxide
zoxide init nushell | save -f ~/.zoxide.nu

# Starship prompt
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
