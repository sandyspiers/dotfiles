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

Note that this clones the chezmoi dotfiles use HTTPS,
so if you plan to push some changes, you will have to edit the remote.

## Usage

### Zellij

We break this down into three sections.

1. Chording

| Keymap      | Action                    |
| ----------- | ------------------------- |
| Alt+h/j/k/l | Move focus using vim keys |
| Alt+i/o     | Move tab focus left/right |
| Alt+I/O     | Move tab left/right       |
| Alt+f       | Toggle floating panes     |
| Alt+n/N     | next/previous layout      |

2. Unlocked, Zellij actions

Let unlock be `Alt+g`.
Once unlocked,

| Keymap | Action                                       |
| ------ | -------------------------------------------- |
| n/N    | New pane/tab                                 |
| x/X    | Close pane/tab                               |
| r      | rename tab (enter rename tab mode)           |
| z      | resiZe tab (enter resize mode)               |
| m      | move pane (enter move mode)                  |
| f      | toggle pane embed/floating                   |
| F      | Toggle focus fullscreen                      |
| v      | enter scroll mode                            |
| V      | open history in editor, starting from bottom |
| q      | quit                                         |
| d      | detach                                       |
| b      | break pane into new tab                      |
| 1-9    | go to tab num                                |

3. Unlocked, Zellij run

| Keymap | Action                         |
| ------ | ------------------------------ |
| y      | open yazi in new pane          |
| e      | open editor in new pane        |
| g      | Run lazygit in floating pane   |
| t      | run fzf to find a file to fail |
