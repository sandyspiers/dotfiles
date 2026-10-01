# nvim (LazyVim)

- Stock LazyVim keymaps; leader is `Space`. Nothing to memorise up front: ask nvim.
- Grow this sheet with the keys you actually use.

## Finding keymaps

| Key | Shows |
|-----|-------|
| `Space`, then wait | Leader menu by group; press a group letter to drill in, `BS` to go back |
| `g` `z` `]` `[` `C-w`, then wait | The same menu for those prefixes |
| `<leader>sk` | Fuzzy search all keymaps: type what you want ("rename", "hunk") |
| `<leader>?` | Keymaps for this buffer only (LSP, vimtex, ...) |
| `?` in a picker or the explorer | That window's own keys |

## Finding features

| Key or command | Shows |
|----------------|-------|
| `<leader>sC` | Search every command |
| `<leader>sh` | Search help pages |
| `:LazyExtras` | Optional bundles (languages, editor tools); `x` toggles one |
| `<leader>l` | Plugins (`:Lazy`): what's installed, update, profile |
| `<leader>L` | LazyVim changelog: new features after an update |
| `:LazyHealth` | Problems with the setup |
| `<leader>n` | Notification history (missed a message?) |
| `<leader>sR` | Resume the last picker |

## Learning loop

1. Doing something the slow way? Press `Space` and browse, or `<leader>sk` and describe it.
2. Use the key a few times this week.
3. Add it to this sheet once it sticks.

Full reference: <https://www.lazyvim.org/keymaps>. This config: `~/.config/nvim/lua/`.
