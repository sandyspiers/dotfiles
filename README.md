# Sandy's Dotfiles

> Chaos, configured chaotically

Well,
I'm trying to be less chaotic,
with the help of ansible and chezmoi.

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

Install git and clone down this repo anywhere.

To install a minimal dev setup, simply run

```bash
./install.sh
```

This script installs ansible and runs the playbook in [`ansible/main.yml`](./ansible/main.yml).
At the moment, it only works on Arch, but some day I will extend this to work on Ubuntu as well.
For a more complete installation, use one of the levels suggested below.

#### Installation Levels

The playbook supports three installation levels (cumulative):

| Level     | Packages                                             | Use Case                          |
| --------- | ---------------------------------------------------- | --------------------------------- |
| `minimal` | helix, zellij, yazi, lazygit, shells, core CLI tools | Quick setup on any machine        |
| `dev`     | minimal + github-cli, docker, python, julia          | Development workstation           |
| `full`    | dev + latex, fonts                                   | Full workstation with typesetting |

To specify a level, pass it via `-e level=<level>`:

```bash
cd ansible/
ansible-galaxy collection install -r requirements.yml

# Minimal install (default)
ansible-playbook main.yml --ask-become-pass

# Dev install
ansible-playbook main.yml -e level=dev --ask-become-pass

# Full install
ansible-playbook main.yml -e level=full --ask-become-pass
```

Note that this clones the chezmoi dotfiles use HTTPS,
so if you plan to push some changes, you will have to edit the remote.

### Over SSH

1. Install ansible on control node
1. Add the name of the host to [`ansible/inventory`](./ansible/inventory), and make sure its added to your `.ssh/config`
1. cd into `ansible/` and run:

```bash
ansible-galaxy collection install -r requirements.yml
ansible-playbook main.yml -e target=beast --ask-become-pass
```

replacing `beast` with the appropriate hostname.
You could also use `all`, for well, all host in the inventory file.

To specify an installation level on remote:

```bash
ansible-playbook main.yml -e target=beast -e level=dev --ask-become-pass
```
