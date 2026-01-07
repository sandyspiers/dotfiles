def mirror-update [] {
	sudo reflector --verbose --country Australia --sort rate --latest 20 --save /etc/pacman.d/mirrorlist
	open /etc/pacman.d/mirrorlist
}

def git-repo-name [] {
  let git_root = do { git rev-parse --show-toplevel } | complete
  
  if $git_root.exit_code == 0 {
    $git_root.stdout | str trim | path basename
  } else {
    pwd | path basename
  }
}

def zj [] {
    let session_name = git-repo-name
    zellij attach $session_name --create
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
