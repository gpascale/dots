local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function get_user() {
  echo "$USER"
}

function get_arch() {
  echo "$(uname -m)"
}

function get_node_version() {
   echo "$(nvm version)"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[black]%}git:[%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[black]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

POSTEDIT=$'\e[0m'
zle_highlight=(default:bold)

arch_name="$(uname -m)"

declare -A ARCH_PILLS
ARCH_PILLS['arm64']='$bg[green]$fg_bold[yellow] arm %{$reset_color%}'
ARCH_PILLS['x86_64']='$bg[red]$fg_bold[white] x86 %{$reset_color%}'
function get_arch_pill() {
   echo "${ARCH_PILLS['$(uname -m)']}"
}

function get_node_pill() {
   # echo '$bg[white]$fg[black]$(nvm version)%{$reset_color%}'
   echo ''
}

# LOCAL_PROMPT=
# SSH_PROMPT='$fg[green]$(get_user)$fg[white]@$bg[red]$fg[yellow]%m%{$reset_color%} $fg_bold[blue]$(get_pwd) $fg[magenta]$(git_prompt_info)$fg[black]%T$fg[white]
# ➜  '

function 

# Color the machine name background red to make it obvious if we're in an SSH session
if [[ -v SSH_CLIENT ]] || [ -v SSH_TTY ]; then
   PROMPT='$fg[green]$(get_user)$fg[white]@$bg[red]$fg[yellow]%m%{$reset_color%} $fg_bold[blue]$(get_pwd) $fg[magenta]$(git_prompt_info)$fg[black]%T$fg[white]
➜  '
else
   PROMPT="$(get_arch_pill) "'$fg[green]$(get_user)$fg[white]@$fg[yellow]%m $fg_bold[blue]$(get_pwd) $fg[magenta]$(git_prompt_info)$fg[black]%T$fg[white]
➜  '
fi