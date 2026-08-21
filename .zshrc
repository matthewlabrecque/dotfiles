# Enable Starship
eval "$(starship init zsh)"
# Aliases
alias ll="ls -l"
alias vim="nvim"
alias nrd="npm run dev"
alias cdzk="cd $HOME/Documents/zettelkasten"
alias cdp="cd $HOME/Projects"
alias cat="bat"
alias grep="rg"
alias convopus="source $HOME/scripts/convert-to-opus.sh"
alias qsync="cd $HOME/Projects/hortusdigitalis && python $HOME/scripts/quartz-sync.py && npx quartz sync"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
