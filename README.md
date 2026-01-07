# Sandy's Dotfiles

> Chaos, configured chaotically

Well,
I'm trying to be less chaotic,
with the help of ansible and chezmoi.

There are install scripts for fresh Ubuntu & Arch systems.

## Arch Install

1. Boot into ISO
2. Connect to internet (if not on ethernet, use [iwctl](https://wiki.archlinux.org/title/Iwd#iwctl))
3. Run [`archinstall`](https://wiki.archlinux.org/title/Archinstall), choose sensible settings
4. Login, clone this repo

```
sudo pacman -Sy git
git clone https://github.com/sandyspiers/dotfiles
```

5. Run `./install.sh`
