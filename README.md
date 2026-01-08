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

Zellij to manage terminal multiplexing
(and editor windows for that matter),
helix to edit files,
nushell as a shell.

My approach to keybindings is as follows,

1. Try propose them myself, as they are more likely to be remebered
1. Any action that is likely to be repeated quickly, like moving zellij pane or helix buffer, should have a chord-able keybinding
1. Everything else should be sequence of keys, like a tap-dance, with nemonics

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
| Alt+h/j/k/l | move focus using vim keys |
| Alt+i/o     | move tab focus left/right |
| Alt+I/O     | move tab left/right       |
| Alt+f       | toggle floating panes     |
| Alt+n/N     | next/previous layout      |

2. Unlocked, Zellij actions

Let unlock be `Alt+g`.
Once unlocked,

| Keymap | Action                                       |
| ------ | -------------------------------------------- |
| n/N    | new pane/tab                                 |
| x/X    | close pane/tab                               |
| r      | rename tab (enter rename tab mode)           |
| z      | resiZe tab (enter resize mode)               |
| m      | move pane (enter move mode)                  |
| f      | toggle pane embed/floating                   |
| F      | toggle focus fullscreen                      |
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
| g      | run lazygit in floating pane   |
| t      | run fzf to find a file to fail |
