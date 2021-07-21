local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

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
# PROMPT='$fg[green]$(get_user)$fg[white]@$fg[yellow]%m $fg_bold[blue]$(get_pwd) %{$reset_color%}%{$fg[magenta]%}$(git_prompt_info)%{}%}%T
# %{$reset_color%}$fg[blue]>%{$fg[white]%} '
PROMPT='$fg[green]$(get_user)$fg[white]@$fg[yellow]%m $fg_bold[blue]$(get_pwd) $fg[magenta]$(git_prompt_info)$fg[black]%T$fg[white]
➜  '