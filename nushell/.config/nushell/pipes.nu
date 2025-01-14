def fx [] {
	fzf | hx $in
}

def zellij-repl [] {
	zellij action rename-pane "REPL_SENDER"
 	zellij pipe "zjpane::focus::REPL"
	zellij action write-chars $"($in)"
 	zellij pipe "zjpane::focus::REPL_SENDER"
	zellij action undo-rename-pane
}

