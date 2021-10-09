# vim: ft=zsh foldmethod=marker foldlevel=0


if [[ "$OSTYPE" == "linux"* ]]; then
  path+=("/home/linuxbrew/.linuxbrew/bin")
fi

# Put home folder bin first in path
path=("$HOME/.local/bin" $path)

path+=("$HOME/go/bin")
path+=("$HOME/.cargo/bin")
path+=(".")

eval $(brew shellenv)

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


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
