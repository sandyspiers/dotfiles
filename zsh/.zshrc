# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh and Zsh installation.
export ZSH="/usr/share/oh-my-zsh"
export ZSH_CUSTOM="/usr/share/zsh"

# check if we are in WSL2, and do whatever you need
if [[ $(grep -i WSL /proc/version) ]]; then
    # get the master Xorg server (e.g. for plotting things)
    export DISPLAY=$(ip route list default | awk '{print $3}'):0
    export LIBGL_ALWAYS_INDIRECT=1
fi

# ssh agent settings
zstyle :omz:plugins:ssh-agent agent-forwarding yes

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  ssh-agent
  fast-syntax-highlighting
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# User configuration

# bind ctrl+spc to auto suggetions accept
# bindkey '^I' autosuggest-accept

# quick configs
alias vi="nvim"
alias vv="vi ."
alias conf="vi ~/dotfiles"
alias zshconf="vi ~/.zshrc"
alias vimconf="vi ~/.config/nvim"

# exa
alias x="eza -a --icons=always"
alias xx="x -l"
alias xr="x -T --git-ignore"

# lazygit
alias lg="lazygit"

# zoxide
eval "$(zoxide init zsh)"

# Use startship prompt
eval "$(starship init zsh)"
