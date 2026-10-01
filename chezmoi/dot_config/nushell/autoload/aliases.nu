# Generic one-liners; tool-specific aliases live in that tool's file
alias v = nvim
alias ex = exit
alias ll = ls -a
alias cm = chezmoi
alias x = xdg-open
alias lg = lazygit
def pr [] { ps | where status =~ Running | sort-by cpu }
