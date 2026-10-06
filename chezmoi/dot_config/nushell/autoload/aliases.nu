# Generic one-liners; tool-specific aliases live in that tool's file
alias v = nvim
alias ex = exit
alias l = ls -a
alias cm = chezmoi
alias x = xdg-open
alias lg = lazygit
alias t = tmux-project  # one session per project; ~/.local/bin/tmux-project
alias g = glow
def pr [] { ps | where status =~ Running | sort-by cpu }
