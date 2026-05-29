# Sandy's Dotfiles

> Chaos, configured chaotically

Well,
I'm trying to be less chaotic,
with the help of chezmoi.

## Design Principles

Basically, we'll try stick close to the terminal,
and employ as much of the UNIX philosphy as possible.
I need this all to work entirely within a terminal,
so tiling window managers are out the question for now
(although one day I may get there)...

My approach to keybindings is as follows,

1. Try propose them myself, as they are more likely to be remebered.
1. Any action that is likely to be repeated quickly,
   like moving tmux pane or nvim buffer,
   should have a chord-able keybinding.
1. Everything else should be sequence of keys, like a tap-dance, with nemonics

See more in [KEYBINDS.md](./KEYBINDS.md)

## Install

## Arch

First step is to setup Arch.

### Using ISO

1. Boot in Arch ISO
1. Setup internet using ethernet or `iwctl`
1. Run `pacman -Sy`
1. Run `archinstall`, choosing appropriate defaults
1. Reboot and login, clone down repo and carry on below

### Using WSL

1. In powershell, run `wsl --install archlinux`,
   this should take you string into arch
1. Perform system update `pacman -Syu`
1. Set root password `passwd`
1. Install sudo and vi with `pacman -S sudo vi vim`
1. Make the `wheel` user group sudoers, by doing `visudo`, and uncommenting the correct line
1. Create user `useradd -m sandy`
1. Give user password `passwd sandy`
1. Add new user to `wheel` group: `usermod -aG wheel sandy`. Check it worked by doing `groups sandy`
1. Edit config with `vim /etc/wsl.conf` and append the file with

```
[user]
default=sandy
```

1. Exit wsl, kill the VM with `wsl --terminate archlinux`
1. Log back in. To get the correct home dir do `wsl -d archlinux --cd ~`
1. To get some things working with parent windows, install `xdg-utils`
1. If the locale is an issue, run `sudo vim /etc/locale.gen` and uncomment the correct one, then run `sudo locale-gen`

### Once logged in

Install git and clone this repo anywhere, then run `bootstrap.sh`.

```bash
git clone https://github.com/sandyspiers/chezmoi.git
cd chezmoi
bash bootstrap.sh          # dev (default)
bash bootstrap.sh minimal  # minimal
bash bootstrap.sh full     # full
```

#### Installation Levels

Three cumulative levels are supported:

| Level     | Packages                                                  | Use case                   |
| --------- | --------------------------------------------------------- | -------------------------- |
| `minimal` | shells, core CLI tools (bat, fzf, ripgrep...), helix, tmux, yazi | Quick setup on any machine |
| `dev`     | minimal + neovim + LSPs/formatters, git tools, node, python, julia, podman | Development workstation    |
| `full`    | dev + fonts                                               | Full workstation           |

#### LaTeX (optional)

LaTeX is not included in any level. To install it separately after bootstrapping:

```bash
bash latex.sh
```

This installs texlive, biber, zathura, and a handful of fonts from [`packages/latex.txt`](./packages/latex.txt).

#### Notes

- `bootstrap.sh` clones the chezmoi dotfiles over HTTPS — if you plan to push changes, update the remote afterwards.
- Julia apps (`JETLS`, `JuliaFormatter`, `Runic`) are installed as part of the `dev` level via the `julia-app` helper script.
