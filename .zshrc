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

# nvm (node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_INSTALL_DIR/nvm.sh" ] && \. "$NVM_INSTALL_DIR/nvm.sh"  # This loads nvm

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt INC_APPEND_HISTORY_TIME

# M1 env stuff
# arch_name="$(uname -m)"
# if [ "${arch_name}" = "x86_64" ]; then
#   nvm use x86
# elif [ "${arch_name}" = "arm64" ]; then
#   nvm use arm
# fi

setopt autocd


if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# start ssh-agent to avoid having to type password all the time
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_ed25519

eval `keychain --agents ssh --eval id_ed25519`

. $HOME/git/e14/dev.env/bin/activate
