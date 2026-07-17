# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mlab/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Enable Starship=
eval "$(starship init zsh)"

# Node Version Management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias ll="ls -l"
alias vim="nvim"
alias nrd="npm run dev"
alias zettk="zettk-cli"
alias zk="zettk-cli"
alias default="source $HOME/scripts/default-tmux.sh"
alias cdzk="cd $HOME/zettelkasten"
alias cdp="cd $HOME/Projects"
alias lgit="lazygit"
alias cat="bat"
alias grep="rg"
alias convopus="source $HOME/scripts/convert-to-opus.sh"
alias qsync="cd $HOME/Projects/hortusdigitalis && python $HOME/scripts/quartz-sync.py && npx quartz sync"
