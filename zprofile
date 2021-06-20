# vim: ft=zsh foldmethod=marker

eval $(brew shellenv)
eval $(zoxide init zsh)

#: FZF {{{

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd (https://github.com/sharkdp/fd) instead of the default find
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

# fdf - cd to selected directory
fdf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
#: }}}

if [[ "$OSTYPE" == "darwin"* ]]; then
  path+=("/Library/Developer/CommandLineTools/usr/bin")
  path+=("$HOME/Library/Python/3.9/bin")
  path+=("$HOME/Library/Python/3.8/bin")
fi

# Put home folder bin first in path
path=("$HOME/.local/bin" $path)

path+=("$HOME/go/bin")
path+=("$HOME/.cargo/bin")
path+=(".")

typeset -U path # force path to have only unique values

if command -v nvim &> /dev/null; then
  export VISUAL='nvim'
else
  export VISUAL='vim'
fi
export EDITOR=$VISUAL
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
  $VISUAL -R \
  -c 'set ft=man nomod nolist' \
  -c 'map q :q<CR>' \
  -c 'map <SPACE> <C-D>'\
  -c 'map b <C-U>' \
  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

if command -v bat &> /dev/null; then
  export PAGER=bat
fi

[[ -r ~/.aliases ]] && source ~/.aliases
alias edprof="nvim $ZDOTDIR/.zprofile && source $ZDOTDIR/.zprofile"

