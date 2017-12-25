git clone --bare https://github.com/gpascale/dots2.git $HOME/.cfg
function cfg {
   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
cfg checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  echo "FUCK `cfg checkout 2>&1 | egrep "^\s+(\w|\.)"`"
  cfg checkout 2>&1 | egrep "^\s+(\w|\.)" | awk '{$1=$1};1' | while read LINE; do
    FILE=$LINE
    DIR=`dirname "$FILE" | awk '{$1=$1};1'`
    SRC="$FILE"
    TARGET=".config-backup/$FILE"
    mkdir -p ".config-backup/$DIR"
    mv "$SRC" "$TARGET"
  done  
fi;
cfg checkout
cfg config status.showUntrackedFiles no
