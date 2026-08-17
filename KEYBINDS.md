# Keybindings

## Design Principles

1. Propose bindings personally — self-invented bindings are better remembered
2. Repeated/rapid actions use chords (held modifier + key)
3. Everything else uses tap-dance sequences with mnemonics: `leader → namespace → action`

---

## Tmux

**Prefix:** `M-g` (rare ops only — everyday actions are leaderless chords)

Shift-layer convention: lowercase acts on panes, uppercase acts on windows/session
(`M-x` kill pane / `M-X` kill window, `M-i/o` navigate / `M-I/O` move window, `M-N` new window, `M-D` detach).

### Chords (no prefix)

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `M-h/j/k/l` | Navigate panes | `M-H/J/K/L` | Resize panes |
| `M-_` | New pane below | `M-\` | New pane beside |
| `M-z` | Zoom pane | `M-x` | Kill pane |
| `M-p` | Break pane to new window | `M-n` | Cycle layout |
| `M-i` / `M-o` | Prev / next window | `M-I` / `M-O` | Move window left / right |
| `M-1`–`M-9` | Select window | `M-N` | New window |
| `M-X` | Kill window | `M-u` | Copy mode |
| `M-s` | Choose session | `M-D` | Detach |
| `M-f` | Floating shell | `M-b` | Floating btop |
| `M-t` | Floating fzf-tail | `M-c` | Floating lazygit |

### Prefix sequences (rare ops)

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `r` | Rename window | `q` | Kill server (confirm) |
| `[` / `]` | Join pane into prev / next window | | |

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
| `<leader>lS` | LSP: workspace symbols | | |
| `K` | LSP: hover | | |
| `<leader>gs` | Git: stage hunk | `<leader>gu` | Git: unstage hunk |
| `<leader>gp` | Git: preview hunk | `<leader>gb` | Git: blame line |
| `<leader>gd` | Git: diff | | |
| `<leader>ff` | Find: files | `<leader>fd` | Find: current dir |
| `<leader>fg` | Find: grep | `<leader>fb` | Find: buffers |
| `<leader>fr` | Find: recent | `<leader>fn` | Find: new file |
| `<leader>fh` | Find: help | | |
| `<leader>dh` | Diag: hover | `<leader>dd` | Diag: document |
| `<leader>dw` | Diag: workspace | | |
| `<leader>za` | Fold: close all | `<leader>zo` | Fold: open all |
| `<leader>zt` | Fold: top level | `<leader>zm` | Fold: module level |
| `h` (at line start) | Fold: close (origami) | `l` (on fold) | Fold: open recursively (origami, custom `zO`) |
| `^` (at line start) | Fold: close recursively (origami) | `$` (on fold) | Fold: open recursively (origami) |
| `<leader>wh/j/k/l` | Window: navigate | | |
| `<leader>wv` | Window: vert split | `<leader>ws` | Window: horiz split |
| `<leader>wx` | Window: close | `<leader>wo` | Window: close others |
| `<leader>wq` | Window: quit | `<leader>wt` | Window: transpose |
| `<leader>wm` | Window: zoom toggle | | |
| `<leader>bb` | Buffer: alternate | `<leader>bx` | Buffer: close |
| `<leader>bo` | Buffer: close others | `<leader>bi` | Buffer: close invisible |
| `<leader>ba` | Buffer: close all | | |
| `<leader>ra` | Replace: all in file | `<leader>rf` | Replace: forward (repeat `.`) |
| `<leader>rb` | Replace: backward (repeat `.`) | `<leader>rf` | Replace: forward (visual) |
| `<leader>ts` | Toggle: spell | `<leader>tw` | Toggle: wrap |
| `<leader>tr` | Toggle: relative numbers | `<leader>td` | Toggle: diagnostics |
| `<leader>th` | Toggle: inlay hints | `<leader>tz` | Toggle: zen |
| `<leader>uf` | Toggle: autoformat | | |
| `<leader>uu` | Undotree: toggle | `<leader>e` | Toggle explorer |
| `<leader>L` | Lazy plugin manager | `<leader>qq` | Quit all |

### Built-ins (kept as-is)

| Key | Action |
|-----|--------|
| `<C-w>hjkl` | Navigate windows |

### Deferred

- Fold jump navigation — revisit when keyboard layout settles
