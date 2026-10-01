# tmux

- Everyday actions are `Alt+key`, no prefix. Sofle: tap **Alt** (left corner), then the key.
- Right hand is spatial; left hand uses vim `C-w` or mnemonic letters.

## Panes

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `M-h/j/k/l` | Focus left / down / up / right | `M-H/J/K/L` | Move pane (swap, focus follows) |
| `M-n` `M-m` `M-,` `M-.` | Resize left / down / up / right | `M-y` | Cycle layout |
| `M-s` | Split below (vim `C-w s`) | `M-v` | Split right (vim `C-w v`) |
| `M-z` | Zoom | `M-x` | Kill pane |
| `M-p` | Break pane into its own window | | |

## Windows and sessions

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `M-1`…`M-9` | Select window N | `M-a` | Last window (toggle) |
| `M-i` / `M-o` | Previous / next window | `M-I` / `M-O` | Swap window left / right |
| `M-c` | New window | `M-q` | Kill window (asks) |
| `M-r` | Rename window | `M-w` | Session / window tree |
| `M-d` | Detach | `M-/` | Copy mode |

## Floating runners (`M-f`, then key)

- Popup in the current directory; any other key cancels. Sofle: **F**, then the key.

| Key | Opens | Key | Opens |
|-----|-------|-----|-------|
| `g` | lazygit | `b` | btop |
| `y` | yazi | `t` | fzf-tail |
| `s` | Shell | `k` | Keybind sheets (glow) |
| `p` | Project picker (`~/files/*/*`) | | |

## Projects (one session each)

- A session per project, named after its git root (else the directory) and started there.
- From a shell, `t` attaches outside tmux and switches inside it.

| Do | Key or command |
|----|----------------|
| Open the project you are in | `t` |
| Open a project by zoxide keywords | `t vesopt` |
| Open any project from inside tmux | `M-f p` |
| Switch between open projects | `M-w`, or `M-;` `a` for the last one |
| Reconnect after closing the terminal | `tmux attach` |

## Prefix (`M-;`, then key)

Rare ops: the no-prefix action one level up.

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `a` | Last session (toggle) | `x` | Kill session (asks) |
| `n` | New session | `$` | Rename session |
| `h` / `l` | Join pane into previous / next window | `R` | Reload `tmux.conf` |
| `q` | Kill server (asks) | `:` / `?` | Command prompt / list all keys |
| `M-;` | Send a literal `M-;` | | |

## Copy mode (vi keys)

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `v` | Begin selection | `C-v` | Toggle rectangle selection |
| `y` | Copy and exit | `/` `?` `n` `N` | Search down / up, next / previous |

- The shell never sees `M-b` `M-f` `M-d` `M-c` `M-.`; use `Ctrl`+arrows for word jumps.
