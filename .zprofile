###############################################################################33
# PATH additions
# 

# Homebrew installations
PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
# Personal Scripts
PATH=$HOME/scripts:$PATH

###############################################################################
# Random other env vars and stuff

export POSTGRES_DIR="/Users/gtp/Library/Application Support/Postgres/var-11"
export NVM_INSTALL_DIR="/opt/homebrew/opt/nvm"
export CONDA_DIR="$HOME/anaconda3"

if [ -f "$HOME/.zprofile.local" ]; then
  source "$HOME/.zprofile.local"
fi

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH
