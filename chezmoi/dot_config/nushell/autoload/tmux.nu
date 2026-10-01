# Session name for the current directory: its git repo, else the directory
def git-repo-name [] {
  let git_root = do { git rev-parse --show-toplevel } | complete

  if $git_root.exit_code == 0 {
    $git_root.stdout | str trim | path basename
  } else {
    pwd | path basename
  }
}

# Attach to the session named after this repo, creating it if needed
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

# Pick a session with fzf and attach to it
def tmux-attach-fzf [] {
    let name = (tmux list-sessions -F "#{session_name}" | fzf)
    tmux attach-session -t $name
}
alias tf = tmux-attach-fzf
