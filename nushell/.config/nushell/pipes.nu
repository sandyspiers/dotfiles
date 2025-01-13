def fx [] {
	fzf | hx $in
}

def zellij-repl [] {
	zellij pipe "zjpane::focus::REPL"
	zellij action write-chars $"($in)"
	zellij action focus-previous-pane
}

