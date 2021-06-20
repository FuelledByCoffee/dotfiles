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
source "/$prefix/opt/fzf/shell/key-bindings.zsh"
