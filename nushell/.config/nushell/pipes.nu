def zellij-repl [] {
	zellij action move-focus right
	zellij action write-chars $"($in)"
	zellij action move-focus left
}

