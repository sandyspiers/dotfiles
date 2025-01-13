# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"

# pyenv
$env.PATH = ($env.PATH | split row (char esep) | prepend $"(pyenv root)/shims")

# Zoxide
zoxide init nushell | save -f ~/.zoxide.nu

# Starship prompt
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
