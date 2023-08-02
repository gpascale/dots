autoload -U colors && colors
setopt PROMPT_SUBST

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function get_user() {
  echo "$USER"
}


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[black]%}git:[%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[black]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

POSTEDIT=$'\e[0m'
zle_highlight=(default:bold)

# Color the machine name background red to make it obvious if we're in an SSH session
if [[ -v SSH_CLIENT ]] || [ -v SSH_TTY ]; then
   PROMPT='$fg[green]$(get_user)$fg[white]@$bg[red]$fg[yellow]%m (SSH)%{$reset_color%} $fg_bold[blue]$(get_pwd) $fg[magenta]$(git_prompt_info)$fg[black]%T$fg[white]
➜ '
else
   PROMPT='$fg[green]$(get_user)$fg[white]@$fg[yellow]%m $fg_bold[blue]$(get_pwd) $fg[magenta]$(git_prompt_info)$fg[black]%T$fg[white]
➜ '
fi