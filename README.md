Usage:

```
git clone --bare git@github.com:gpascale/dots.git $HOME/.cfg

git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

cd .scripts/

./bootstrap.sh

./install.sh
```
