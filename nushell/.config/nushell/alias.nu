# basic
alias hx = helix
alias hxi = hx $in
alias conf = hx ~/dotfiles
alias ex = exit
alias ze = zellij
alias za = ze a --index
alias fd = fd -H
alias ll = ls -a

# latex
alias tex = latexmk --interaction=nonstopmode

# julia
alias jl = julia -q --sysimage=/home/sandy/dotfiles/juliasys/base.so

# git
alias lg = lazygit
alias gr = git root

# repl setup
alias repl = zellij action rename-pane "REPL"

# yazi
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# eza
alias x = eza -a -l --icons=always
alias xr = x -T --git-ignore
