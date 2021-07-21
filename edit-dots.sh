set -e

cd $HOME;
. .aliases;
rm -rf $HOME/.dots;
mkdir $HOME/.dots && cfg ls-tree --full-tree --name-only HEAD | xargs -I {} ln -s $HOME/{} $HOME/.dots/{}
echo "Created a folder, $HOME/.dots, containing symlinks to all files/folders managed by dots repo."
echo "Attempting to open $HOME/.dots in VSCode. If not installed, open $HOME/.dots using any editor."
code $HOME/.dots
