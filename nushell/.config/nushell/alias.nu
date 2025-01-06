# 
alias hx = helix
alias conf = hx ~/dotfiles

alias ze = zellij

# 
alias lg = lazygit

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
