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

