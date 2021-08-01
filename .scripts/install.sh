#!/usr/bin/env zsh

set -e

###############################################################################
# Do some final zsh setup

# Copy over my custom ZSH theme
ZSH_CUSTOM_THEMES_DIR="$HOME/.oh-my-zsh/custom/themes"
[ -d "$ZSH_CUSTOM_THEMES_DIR" ] || mkdir $ZSH_CUSTOM_THEMES_DIR
cp -f "$HOME/.appsettings/zsh/greg.zsh-theme" $ZSH_CUSTOM_THEMES_DIR

# Check out and set up the zsh syntax highlighting plugin
ZSH_CUSTOM_PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
SHL_DIR="$ZSH_CUSTOM_PLUGIN_DIR/zsh-syntax-highlighting"
[ -d "$ZSH_CUSTOM_PLUGIN_DIR" ] || mkdir $ZSH_CUSTOM_PLUGIN_DIR
[ -d "$SHL_DIR" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SHL_DIR


###############################################################################
# Copy over app settings

APP_SETTINGS_DIR="$HOME/.appsettings"
APP_SUPPORT_DIR="$HOME/Library/Application Support"
PREFS_DIR="$HOME/Library/Preferences"

# BetterSnapTool
cp -r "$APP_SETTINGS_DIR/BetterSnapTool/AppSupport/." "$APP_SUPPORT_DIR/BetterSnapTool" 
cp -r "$APP_SETTINGS_DIR/BetterSnapTool/." "$PREFS_DIR"

# VS Code
cp -r "$APP_SETTINGS_DIR/VSCode/." "$APP_SUPPORT_DIR/Code"

# Make changes take effect
source ~/.zshrc



