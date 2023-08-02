# set up "config" command for managing dotfiles repo
alias cfg='/usr/bin/git --git-dir=/Users/gtp/.cfg/ --work-tree=/Users/gtp'

autoload -Uz compinit
compinit

source $HOME/.zsh.d/plugins/git.plugin.zsh
source $HOME/.zsh.d/plugins/git.zsh
source $HOME/.zsh.d/plugins/jsontools.plugin.zsh
source $HOME/.zsh.d/plugins/z.plugin.zsh

source $HOME/.zsh.d/greg.zsh-theme

export _Z_CMD=z

# set up aliases and functions
source $HOME/.aliases
source $HOME/.functions.sh

setopt autocd

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi


