# Sandy's Dotfiles

> Chaos, configured chaotically

Well,
I'm trying to be less chaotic,
with the help of ansible and chezmoi.

## Design Principles

TBC...

## Install

To install my setup on a new machine,
simply run

```bash
./install.sh
```

This script installs ansible and runs the playbook in [`ansible/main.yml`](`ansible/main.yml`).
The playbook installs all dev tools, languages and sets up chezmoi.
At the moment, it only works on Arch, but some day I will extend this to work on Ubuntu as well.
