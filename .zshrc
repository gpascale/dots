# set up "config" command for managing dotfiles repo
alias config='/usr/bin/git --git-dir=/Users/gtp/.cfg/ --work-tree=/Users/gtp'

# zsh configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="greg" # maybe try random at some point
plugins=(git zsh-syntax-highlighting z encode64 jsontools compleat npm rand-quote urltools wd)
source $ZSH/oh-my-zsh.sh

# set up aliases and functions
source $HOME/.aliases
source $HOME/.functions.sh

# aws creds
source $HOME/.aws/.creds

# Conda setup. Do not edit this
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gtp/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gtp/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gtp/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gtp/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Load direnv
eval "$(direnv hook zsh)"

# nvm (node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use v12.20.0

