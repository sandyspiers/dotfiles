# yazi

- `y` from nu opens yazi and cds to its directory on quit; `M-f y` opens it in a popup.
- Custom keys live in `~/.config/yazi/keymap.toml`; everything else is the default. `~` lists all keys.

## Custom

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `gp` | `~/files/projects` | `gr` | `~/files/research` |
| `gs` | `~/files/scratch` | `ga` | `~/files/admin` |
| `go` | `~/files/tools` | `gF` | `~/files/forks` |
| `T` | tmux session for the hovered project | | |

- `T` takes the hovered directory, or a file's directory, then its git root (`tmux-project`).

## Moving

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `h/j/k/l` | Parent / down / up / enter | `H` / `L` | Back / forward in history |
| `gg` / `G` | Top / bottom | `C-u` / `C-d` | Half page up / down |
| `gh` `gc` `gd` | Home, `~/.config`, `~/Downloads` | `gt` | Trash |
| `z` | Jump via fzf | `Z` | Jump via zoxide |
| `g Space` | Type a path to jump to | `gf` | Follow symlink |

## Finding

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `/` / `?` | Find next / previous | `n` / `N` | Next / previous match |
| `f` | Filter the listing | `s` / `S` | Search names (fd) / contents (rg) |
| `.` | Toggle hidden files | `,` | Sort (`,m` modified, `,e` extension, ...) |

## Files

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `Enter` / `o` | Open | `O` | Open with (menu) |
| `Space` | Select and move down | `v` / `V` | Visual select / unselect |
| `y` / `x` | Yank / cut | `p` / `P` | Paste / paste overwriting |
| `a` | Create (end with `/` for a dir) | `r` | Rename |
| `d` / `D` | Trash / delete permanently | `cc` / `cf` | Copy path / filename |
| `;` / `:` | Shell command / blocking shell | `w` | Task manager |

## Opening

| File | Opens with |
|------|-----------|
| `*.csv` | visidata (in the terminal) |
| `*.html`, PDFs, images, anything unknown | `xdg-open` (detached; survives quitting yazi) |
| Text, JSON | `$EDITOR` (nvim) |
| Audio, video | `xdg-open` |
