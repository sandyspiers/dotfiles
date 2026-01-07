# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"
$env.JULIA_SHELL = "bash"

# this is needed for quarto mermaid png export
$env.QUARTO_CHROMIUM = "/usr/bin/chromium"

# add localbin
$env.PATH = ($env.PATH | prepend "/home/sandy/.local/bin")

# add biber in vendor perl (god i hate that i have to do this...)
$env.PATH = ($env.PATH | prepend "/usr/bin/vendor_perl")

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
