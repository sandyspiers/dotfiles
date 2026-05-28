# # Custom Settings

$env.config.buffer_editor = 'helix'
$env.config.show_banner = false
$env.config.shell_integration.osc133 = false

# aliases
source alias.nu

# functions
source funcs.nu

# ssh agent
source ssh.nu

# override vendors
source zoxide.nu
source starship.nu
source yazi.nu
source mise.nu

# Completions (keep this for last)
source completions.nu
