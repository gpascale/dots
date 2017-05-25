#!/usr/bin/env zsh

# Copy files to home directory
rsync --exclude "*.zsh-theme" --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" --exclude "*~" -avc --no-perms . ~

# Copy over my custom ZSH theme
ZSHDIR="$HOME/.oh-my-zsh/custom/themes"
[ -d "$ZSHDIR" ] || mkdir $ZSHDIR
cp -f "greg.zsh-theme" $ZSHDIR

# Source .bash_profile to have changes take effect
source ~/.zshrc

# TODO - check out and set up the zsh syntax highlighting plugin
PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
SHL_DIR="$PLUGIN_DIR/zsh-syntax-highlighting"
[ -d "$PLUGIN_DIR" ] || mkdir $PLUGIN_DIR
[ -d "$SHL_DIR" ] || git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $SHL_DIR

# Install some node modules globally
npm install -g eslint
npm install -g eslint-plugin-react
npm install -g eslint-plugin-json
