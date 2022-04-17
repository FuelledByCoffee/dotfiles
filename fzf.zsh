# Setup fzf
# ---------
prefix=$(brew --prefix)
if [[ ! "$PATH" == "*$prefix/opt/fzf/bin*" ]]; then
  export PATH="${PATH:+${PATH}:}$prefix/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/$prefix/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$prefix/opt/fzf/shell/key-bindings.zsh"

export FZF_DIR="$prefix/opt/fzf"
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="\
  --height 90% \
  --layout=reverse \
  --border=sharp \
  --margin=1 \
  --padding=1 \
  --prompt='All> ' \
  --bind 'ctrl-f:change-prompt(Files> )+reload(fd -t f)' \
  --bind 'ctrl-d:change-prompt(Directories> )+reload(fd -t d)' \
  --bind 'ctrl-a:change-prompt(All> )+reload(fd)' \
  --preview '([[ -f {} ]] && (bat --style=plain --color=always {} \
  || cat {})) \
  || ([[ -d {} ]] && (exa -T {})) \
  || echo {} 2> /dev/null | head -200'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"


# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}


# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}


# Search for and kill process
function hunt() {
  ps -ef | fzf | awk '{print $2}' | xargs kill -9
}


bindkey '^p' fzf-cd-widget

