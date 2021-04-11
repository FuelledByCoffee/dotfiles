# Setup fzf
# ---------
if [[ $(uname -m) == "arm64"* ]]; then
  prefix="/opt/homebrew/opt"
elif [[ "$OSTYPE" == "linux"* ]]; then
  prefix="~/home/linuxbrew/.linuxbrew"
else
  prefix="/usr/local"
fi

if [[ ! "$PATH" == "*${prefix}/fzf/bin*" ]]; then
  export PATH="${PATH:+${PATH}:}${prefix}/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${prefix}/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/${prefix}/fzf/shell/key-bindings.zsh"
