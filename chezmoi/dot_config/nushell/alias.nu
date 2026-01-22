# aliases and small named functions
alias hx = helix
alias h = hx .
alias hxi = hx $in
alias ex = exit
alias ll = ls -a
alias cm = chezmoi
def pr [] { ps | where status =~ Running | sort-by cpu }
alias x = xdg-open

# zellij (defined in funcs.nu)
# alias zj = zellij-attach-git
# alias zf = zellij-attach-fzf

# latex
alias tex = latexmk --interaction=nonstopmode

# julia
alias jl = julia -q --project=@.

# git
alias lg = lazygit
