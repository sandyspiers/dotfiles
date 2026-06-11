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
git clone https://github.com/sandyspiers/dotfiles.git
cd chezmoi
bash bootstrap.sh
```

This installs all packages from [`packages/dev.txt`](./packages/dev.txt).

#### Optional extras

These are not included in the base bootstrap and must be run separately:

```bash
bash julia.sh  # juliaup, JETLS, JuliaFormatter, Runic
bash latex.sh  # texlive, biber, zathura, fonts
```

## Ubuntu (via Distrobox)

`bootstrap.sh` only supports Arch. On Ubuntu, the recommended approach is to run an
Arch container via [Distrobox](https://distrobox.it), which shares your home directory
so dotfiles apply to both host and container.

First, install Docker by following the [official Ubuntu instructions](https://docs.docker.com/engine/install/ubuntu/).

Then run `ubuntu.sh` to install Distrobox and create the Arch container:

```bash
bash ubuntu.sh
```

Enter the container and bootstrap as normal:

```bash
distrobox enter arch
git clone https://github.com/sandyspiers/dotfiles.git
cd chezmoi && bash bootstrap.sh
```

After bootstrapping, nushell is the default shell in the container. Re-enter with:

```nu
distrobox enter arch -- nu
```

To make tools available outside the container, export the binaries you want on the host:

```bash
distrobox-export --bin $(which nvim)
distrobox-export --bin $(which lazygit)
```

#### Notes

- `bootstrap.sh` clones the chezmoi dotfiles over HTTPS — if you plan to push changes, update the remote afterwards.
- Julia apps (`JETLS`, `JuliaFormatter`, `Runic`) are installed separately via `julia.sh`.
