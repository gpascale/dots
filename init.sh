 #!/usr/bin/env zsh

# Copy files to home directory
rsync --exclude "*.zsh-theme" --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" --exclude "*~" -avc --no-perms . ~

# Copy over my custom ZSH theme
ZSHDIR="$HOME/.oh-my-zsh/custom/themes"
[ -d "$ZSHDIR" ] || mkdir $ZSHDIR
cp -f "greg.zsh-theme" $ZSHDIR

# Source .bash_profile to have changes take effect
source ~/.zshrc
