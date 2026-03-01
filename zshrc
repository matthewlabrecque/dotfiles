# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

eval "$(starship init zsh)"

# opencode
export PATH=/home/mlab/.opencode/bin:$PATH

alias g="git"
alias gcm="git commit -m"
alias ll="ls -l"
alias vim="nvim"
alias nrd="npm run dev"
