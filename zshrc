# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Add Java to the home directory path
export JAVA_HOME="/usr/lib/jvm/java-25-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

# Enable starship
eval "$(starship init zsh)"

# Custom aliases
alias ll="ls -lF"
alias autoremove-check="sudo pacman -Rsp \$(pacman -Qdtq)"
alias autoremove="sudo pacman -Rs \$(pacman -Qdtq)"
alias vim="nvim"

# opencode
export PATH=/home/matthew/.opencode/bin:$PATH
