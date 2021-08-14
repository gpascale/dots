#!/usr/bin/env zsh

set -e

###############################################################################
# Install homebrew and software

if ! command -v "brew"; then
  echo "Homebrew is not installed. Instailling..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Installing software from Homebrew..."
./brew.sh
echo "Installing software (casks) from Homebrew..."
./cask.sh

###############################################################################
# Setup zsh

# Install oh-my-zsh if needed
[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
cat "~/.appsettings/VSCode/extensions.txt" | xargs -I {} code --install-extension {} #install  extensions

# Make changes take effect
source ~/.zshrc



