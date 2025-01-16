# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"

# Display environment
if not (open /proc/version | grep WSL | is-empty) {
  let ip = (ip route list default | split column " " | get column3 | to text | str trim)
  $env.DISPLAY = $"($ip):0"
  $env.LIBGL_ALWAYS_INDIRECT = 1
}

# Zoxide
zoxide init nushell | save -f ~/.zoxide.nu

# Starship prompt
starship init nu | save -f ~/.starship.nu
