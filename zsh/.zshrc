# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/emacs/bin/:$PATH

# Path to your Oh My Zsh and Zsh installation.
export ZSH="/usr/share/oh-my-zsh"
export ZSH_CUSTOM="/usr/share/zsh"

# check if we are in WSL2, and do whatever you need
if [[ $(grep -i WSL /proc/version) ]]; then
    # get the master Xorg server (e.g. for plotting things)
    export DISPLAY=$(ip route list default | awk '{print $3}'):0
    export LIBGL_ALWAYS_INDIRECT=1
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fast-syntax-highlighting
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# manage ssh (but only if im not already in an ssh)
if [[ ! -n "$SSH_CONNECTION" ]]; then
    # check if an agent is running, if not, start one
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 4h > "$HOME/.ssh/ssh-agent.env"
    fi
    # if SSH_AUTH_SOCK doesnt exists, source env vars
    if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
        source "$HOME/.ssh/ssh-agent.env" > /dev/null
        ln -sf $SSH_AUTH_SOCK $HOME/.ssh/ssh_auth_sock
    fi
fi

# User configuration

# bind shift+tab to auto suggetions accept
bindkey '^[[Z' autosuggest-accept

# quick configs
alias vi="nvim"
alias vv="vi ."
alias conf="vi ~/dotfiles"
alias zshconf="vi ~/.zshrc"
alias vimconf="vi ~/.config/nvim"

# julia
alias jl="julia -q --sysimage=/home/sandy/dotfiles/jl-sys/base.so"
export JULIA_LSP_JULIA_BIN="julia --sysimage=/home/sandy/dotfiles/jl-sys/lsp.so"

# pomotimers
alias work="arttime --nolearn -g 25m;30m"

# exa
alias x="eza -a --icons=always"
alias xx="x -l"
alias xr="x -T --git-ignore"

# lazygit
alias lg="lazygit"

# reflector
alias mirror-update="sudo reflector --verbose --country Australia --sort rate --latest 20 --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init zsh)"

# Use startship prompt
eval "$(starship init zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
