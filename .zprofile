###############################################################################33
# PATH additions
# 

# Homebrew installations
arch_name="$(uname -m)"

if [ "${arch_name}" = "x86_64" ]; then
  PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
else
  PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
fi

# Personal Scripts
PATH=$HOME/scripts:$PATH

###############################################################################
# Random other env vars and stuff

export ZSH_CUSTOM="$HOME/.appsettings/zsh/themes"
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
