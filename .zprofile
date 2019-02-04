PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$HOME/miniconda3/bin:$PATH
PATH=$HOME/.local/bin:/usr/local/opt/mysql@5.7/bin:$PATH
PATH=$HOME/scripts:$PATH
# rvm (ruby version manager?)
export PATH="$PATH:$HOME/.rvm/bin"
# nvm (node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
