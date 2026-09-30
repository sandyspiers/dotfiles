# Keybindings

## Design Principles

1. Propose bindings personally — self-invented bindings are better remembered
2. Repeated/rapid actions use chords (held modifier + key)
3. Everything else uses tap-dance sequences with mnemonics: `leader → namespace → action`

---

## Tmux

See [`chezmoi/dot_config/keybinds/tmux.md`](chezmoi/dot_config/keybinds/tmux.md), deployed to `~/.config/keybinds/tmux.md`.
Browse all sheets in `~/.config/keybinds` from tmux with `M-f` then `k`.

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
| `<` / `>` | Indent and keep selection |

### Remapped built-ins

| Key | Action |
|-----|--------|
| `n` / `N` | Search next / prev — always forward / backward, regardless of search direction |
| `j` / `k` | Move by display line on wrapped lines (unless counted) |
| `K` | LSP hover |
| `<CR>` | Accept completion (blink.cmp, insert mode with menu open) |
| `h` (at line start) | Fold: close (origami) |
| `^` (at line start) | Fold: close recursively (origami) |
| `l` / `$` (on fold) | Fold: open recursively (origami, both remapped to `zO`) |

### Leader sequences

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `<leader>ld` | LSP: definition | `<leader>lD` | LSP: declaration |
| `<leader>li` | LSP: implementation | `<leader>lR` | LSP: references |
| `<leader>lr` | LSP: rename | `<leader>la` | LSP: code action |
| `<leader>lf` | Format buffer (conform, LSP fallback) | `<leader>ls` | LSP: symbols |
| `<leader>lS` | LSP: workspace symbols | | |
| `<leader>gs` | Git: stage hunk | `<leader>gu` | Git: unstage hunk |
| `<leader>gp` | Git: preview hunk | `<leader>gb` | Git: blame line |
| `<leader>gd` | Git: diff | `<leader>gr` | Git: reset hunk |
| `<leader>ff` | Find: files | `<leader>fd` | Find: current dir |
| `<leader>fg` | Find: grep | `<leader>fb` | Find: buffers |
| `<leader>fr` | Find: recent | `<leader>fn` | Find: new file |
| `<leader>fh` | Find: help | `<leader>fc` | Find: changed files (git status) |
| `<leader>dh` | Diag: hover | `<leader>dd` | Diag: document |
| `<leader>dw` | Diag: workspace | | |
| `<leader>za` | Fold: close all | `<leader>zo` | Fold: open all |
| `<leader>zt` | Fold: to level 1 | | |
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
| `<leader>uf` | Toggle: autoformat | `<leader>e` | Toggle explorer |
| `<leader>L` | Lazy plugin manager | `<leader>qq` | Quit all |
| `<leader>?` | Which-key: buffer-local keymaps | | |

### Built-ins (kept as-is)

| Key | Action |
|-----|--------|
| `<C-w>hjkl` | Navigate windows |

### Deferred

- Fold jump navigation — revisit when keyboard layout settles
