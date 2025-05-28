def fx [] {
	fzf | hx $in
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
