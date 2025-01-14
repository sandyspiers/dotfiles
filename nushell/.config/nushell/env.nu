# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"

# Zoxide
zoxide init nushell | save -f ~/.zoxide.nu

# Starship prompt
starship init nu | save -f ~/.starship.nu
