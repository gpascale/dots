set -e

cd $HOME;
. .aliases;

# Create a directory called .dots which will serve as the src folder to open in our editor (default VS Code)
rm -rf /tmp/.dots
# Get the list of files managed by git dotfiles repo and find them in ~. Create a symlink to each in .dots
mkdir /tmp/.dots && cfg ls-tree --full-tree --name-only HEAD | xargs -I {} ln -s $HOME/{} /tmp/.dots/{}
# Do the same for any .local files in ~ as these are not checked in to git
ls $HOME/.*.local | xargs basename | xargs -I {} ln -s $HOME/{} /tmp/.dots/{}

echo "Created a folder, /tmp/.dots, containing symlinks to all files/folders managed by dots repo."
echo "Attempting to open /tmp/.dots in VSCode. If not installed, open /tmp/.dots using any editor."
code /tmp/.dots
