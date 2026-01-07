# This file exists so that when I do
# nu -c "..."
# we have the correct environment variables

# Environment variables
$env.SHELL = "nu"
$env.EDITOR = "helix"
$env.JULIA_SHELL = "bash"

# add localbin
$env.PATH = ($env.PATH | prepend "/home/sandy/.local/bin")

# add biber in vendor perl (god i hate that i have to do this...)
# TODO check this!
$env.PATH = ($env.PATH | prepend "/usr/bin/vendor_perl")

# Display environment
# TODO check this!
if not (open /proc/version | grep WSL | is-empty) {
  let ip = (ip route list default | split column " " | get column3 | to text | str trim)
  $env.DISPLAY = $"($ip):0"
  $env.LIBGL_ALWAYS_INDIRECT = 1
}
