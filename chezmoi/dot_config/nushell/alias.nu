alias hx = helix
alias h = hx .
alias hxi = hx $in
alias conf = hx ~/dotfiles
alias ex = exit
alias ll = ls -a
alias cm = chezmoi
def pr [] { ps | where status =~ Running | sort-by cpu }

# latex
alias tex = latexmk --interaction=nonstopmode

# julia
alias jl = julia -q --project=@.

# git
alias lg = lazygit
