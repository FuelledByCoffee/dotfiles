# vim: ft=zsh foldmethod=marker foldlevel=0

[[ -z $TMUX ]] && tmux new -A && exit


# Put home folder bin first in path
path=("$HOME/.local/bin" $path)

path+=("$HOME/go/bin")
path+=("$HOME/.cargo/bin") # rust
path+=("$HOME/.cabal/bin") # haskell
path+=("$HOME/.ghcup/bin") # haskell
path+=("$HOME/.local/llvm/bin")
path+=(".")

[[ -d /home/linuxbrew/.linuxbrew/bin ]] && path=("/home/linuxbrew/.linuxbrew/bin" $path)

if hash brew 2> /dev/null; then
  eval $(brew shellenv)
  prefix=$(brew --prefix)

  export C_INCLUDE_PATH="${C_INCLUDE_PATH:+${C_INCLUDE_PATH}:}$prefix/include"
  export LIBRARY_PATH="${LIBRARY_PATH:+${LIBRARY_PATH}:}$prefix/lib"

  [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
fi

if hash thefuck 2> /dev/null;
then
  eval $(thefuck --alias)
fi

if hash zoxide  2> /dev/null;
then
  eval "$(zoxide init zsh)"
fi

typeset -U path # force path to have only unique values

if hash bat 2> /dev/null;
then
  export PAGER="bat --style=grid"
fi

if hash nvim 2> /dev/null; then
  export VISUAL='nvim'
  export MANPAGER='nvim +Man!'
else
  export VISUAL='vim'
  export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
fi
export EDITOR=$VISUAL

[[ -r ~/.aliases ]] && source ~/.aliases
