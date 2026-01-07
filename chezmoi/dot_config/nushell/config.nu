# # Custom Settings

$env.config.buffer_editor = 'helix'
$env.config.show_banner = false

# aliases
source alias.nu

# functions
source funcs.nu

# repl
source repl.nu

# ssh agent
source ssh.nu

# # Vendor Loading

# Zoxide - only initialize if config doesn't exist
if not ("~/.zoxide.nu" | path exists) {
    zoxide init nushell | save -f ~/.zoxide.nu
}
source ~/.zoxide.nu

# Starship prompt - only initialize if config doesn't exist
if not ("~/.starship.nu" | path exists) {
    starship init nu | save -f ~/.starship.nu
} 
source ~/.starship.nu

# # Best For Last

# Completions (keep this for last)
source completions.nu
