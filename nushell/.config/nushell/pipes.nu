def fx [] {
	fzf | hx $in
}

def zellij-start-julia-repl [] {
	zellij action rename-pane "REPL"
	jl
	exit
}

def zellij-repl [] {
	zellij action rename-pane "REPL_SENDER"
 	zellij pipe "zjpane::focus::REPL"
	let code = $in
	zellij action write-chars $"($code)"
 	zellij pipe "zjpane::focus::REPL_SENDER"
	zellij action undo-rename-pane
}

def mirror-update [] {
	sudo reflector --verbose --country Australia --sort rate --latest 20 --save /etc/pacman.d/mirrorlist
	open /etc/pacman.d/mirrorlist
}

def fmd [] {
	^fmt -u -w 85
}

def bt [] {
	"`"
}
