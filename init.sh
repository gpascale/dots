#!/usr/bin/env bash

# Copy files to home directory
rsync --exclude "*.zsh-theme" --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" --exclude "*~" -avc --no-perms . ~

# Copy over my custom ZSH theme
cp -f "greg.zsh-theme" ~/.oh-my-zsh/custom/themes

# Source .bash_profile to have changes take effect
source ~/.bash_profile