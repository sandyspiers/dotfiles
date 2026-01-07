alias hx = helix
alias hxi = hx $in
alias conf = hx ~/dotfiles
alias ex = exit
alias ll = ls -a
def pr [] { ps | where status =~ Running | sort-by cpu }

# latex
alias tex = latexmk --interaction=nonstopmode

# julia
alias jl = julia -q --project=@.

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
