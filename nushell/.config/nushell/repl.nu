def zellij-init-repl [] {
	if $env.ZELLIJ_PANE_ID? != null {
		$env.ZELLIJ_PANE_ID | save $"/tmp/zellij-repl-($env.ZELLIJ_SESSION_NAME)" -f
	}
}

def zellij-get-repl [] {
	if $env.ZELLIJ_PANE_ID? != null {
		if ($"/tmp/zellij-repl-($env.ZELLIJ_SESSION_NAME)" | path exists) {
			open $"/tmp/zellij-repl-($env.ZELLIJ_SESSION_NAME)"
		} 
	}
}

def zellij-repl [code:string] {
	let repl = zellij-get-repl 
	if repl != null {
		let id = $env.ZELLIJ_PANE_ID
	 	zellij pipe $"zjpane::focus_id::($repl)"
		zellij action write-chars $"($code)"
	 	zellij pipe $"zjpane::focus_id::($id)"
	}
}
