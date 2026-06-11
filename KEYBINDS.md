# Keybindings

## Design Principles

1. Propose bindings personally — self-invented bindings are better remembered
2. Repeated/rapid actions use chords (held modifier + key)
3. Everything else uses tap-dance sequences with mnemonics: `leader → namespace → action`

---

## Tmux

**Prefix:** `M-g`

### Chords (no prefix)

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `M-h/j/k/l` | Navigate panes | `M-n` | Cycle layout |
| `M-i` / `M-o` | Prev / next window | `M-f` | Floating shell |
| `M-I` / `M-O` | Move window left / right | `M-b` | Floating btop |
| `M-y` | Floating yazi | `M-t` | Floating fzf-tail |

### Prefix sequences

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `n` | New pane (split right) | `N` | New window |
| `x` | Kill pane | `X` | Kill window |
| `F` | Zoom pane | `r` | Rename window |
| `v` | Copy mode | `s` | Choose session |
| `d` | Detach | `q` | Kill server |
| `1`–`9` | Select window | `H/J/K/L` | Resize pane (repeatable) |

> **Note:** `bind v split-window -v` is overridden by `bind v copy-mode` in `tmux.conf` — vertical split has no effective binding.

---

## Neovim

**Leader:** `<Space>`

### Chords (repeated actions)

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `<C-s>` | Save | `<Esc>` | Clear search highlights |
| `<C-h>` | Previous buffer | `<C-l>` | Next buffer |
| `<C-j>` | Next git hunk | `<C-k>` | Previous git hunk |
| `<C-n>` | Next diagnostic | `<C-p>` | Previous diagnostic |
| `<C-Up>` | Increase window height | `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width | `<C-Right>` | Increase window width |

### Visual mode

| Key | Action |
|-----|--------|
| `J` / `K` | Move selection down / up |

### Leader sequences

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `<leader>ld` | LSP: definition | `<leader>lD` | LSP: declaration |
| `<leader>li` | LSP: implementation | `<leader>lR` | LSP: references |
| `<leader>lr` | LSP: rename | `<leader>la` | LSP: code action |
| `<leader>lf` | LSP: format | `<leader>ls` | LSP: symbols |
| `K` | LSP: hover | | |
| `<leader>gs` | Git: stage hunk | `<leader>gu` | Git: unstage hunk |
| `<leader>gp` | Git: preview hunk | `<leader>gb` | Git: blame line |
| `<leader>gd` | Git: diff | | |
| `<leader>ff` | Find: files | `<leader>fd` | Find: current dir |
| `<leader>fg` | Find: grep | `<leader>fb` | Find: buffers |
| `<leader>fr` | Find: recent | `<leader>fn` | Find: new file |
| `<leader>fh` | Find: help | | |
| `<leader>dd` | Diag: document | `<leader>dw` | Diag: workspace |
| `<leader>za` | Fold: close all | `<leader>zo` | Fold: open all |
| `<leader>zt` | Fold: top level | `<leader>zm` | Fold: module level |
| `<leader>wv` | Window: vert split | `<leader>ws` | Window: horiz split |
| `<leader>wx` | Window: close | `<leader>wo` | Window: close others |
| `<leader>wq` | Window: quit | `<leader>wm` | Window: zoom toggle |
| `<leader>bb` | Buffer: alternate | `<leader>bx` | Buffer: close |
| `<leader>bo` | Buffer: close others | `<leader>bi` | Buffer: close invisible |
| `<leader>ba` | Buffer: close all | | |
| `<leader>ra` | Replace: all in file | `<leader>rf` | Replace: forward (repeat `.`) |
| `<leader>rb` | Replace: backward (repeat `.`) | `<leader>rf` | Replace: forward (visual) |
| `<leader>ts` | Toggle: spell | `<leader>tw` | Toggle: wrap |
| `<leader>tr` | Toggle: relative numbers | `<leader>td` | Toggle: diagnostics |
| `<leader>th` | Toggle: inlay hints | `<leader>tz` | Toggle: zen |
| `<leader>uu` | Undotree: toggle | `<leader>e` | Toggle explorer |
| `<leader>L` | Lazy plugin manager | `<leader>qq` | Quit all |

### Built-ins (kept as-is)

| Key | Action |
|-----|--------|
| `<C-w>hjkl` | Navigate windows |

### Deferred

- Fold jump navigation — revisit when keyboard layout settles
