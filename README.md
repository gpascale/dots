Usage:

```
# check out files
git clone --bare git@github.com:gpascale/dots.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

# run setup scripts
cd .scripts/
./bootstrap.sh
./install.sh
./macosh.sh
```
