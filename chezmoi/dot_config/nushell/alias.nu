# aliases and small named functions
alias v = nvim
alias ex = exit
alias ll = ls -a
alias cm = chezmoi
def pr [] { ps | where status =~ Running | sort-by cpu }
alias x = xdg-open

# julia
alias jl = julia -q --project --threads auto
alias jlq = jl --startup-file=no
def jlg [name: string] {
    let cmd = $"using Pkg; Pkg.generate\(\"($name)\"\)"
    julia -e $cmd
}

# git
alias lg = lazygit

# utils
alias helix-log = tail -f ~/.cache/helix/helix.log
