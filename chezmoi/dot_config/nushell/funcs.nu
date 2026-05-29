# This file is for functions that do cool things
# Its not really for tiny short-named functions,
# those are in alias.nu

# ==========
# Misc Utils
# ==========

def host-name [] {
    let prefix = if ($env.SSH_CLIENT? | is-not-empty) { "ssh-" } else { "" }
    $"($prefix)(sys host | get hostname)"
}

def mirror-update [] {
	sudo reflector --verbose --country Australia --sort rate --latest 20 --save /etc/pacman.d/mirrorlist
	open /etc/pacman.d/mirrorlist
}

# =====================
# Tmux session helpers
# =====================

def git-repo-name [] {
  let git_root = do { git rev-parse --show-toplevel } | complete

  if $git_root.exit_code == 0 {
    $git_root.stdout | str trim | path basename
  } else {
    pwd | path basename
  }
}

def tmux-attach-git [] {
    let session_name = git-repo-name
    let exists = (tmux has-session -t $session_name | complete).exit_code == 0
    if $exists {
        tmux attach-session -t $session_name
    } else {
        tmux new-session -s $session_name
    }
}
alias t = tmux-attach-git

def tmux-attach-fzf [] {
    let name = (tmux list-sessions -F "#{session_name}" | fzf)
    tmux attach-session -t $name
}
alias tf = tmux-attach-fzf

