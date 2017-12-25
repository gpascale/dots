#!/usr/bin/env zsh

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
[ -d "$SHL_DIR" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SHL_DIR


