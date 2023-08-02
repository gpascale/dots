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



