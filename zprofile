# vim: ft=zsh foldmethod=marker foldlevel=0

[[ "$OSTYPE" == "linux"* ]] && path+=("/home/linuxbrew/.linuxbrew/bin")
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Put home folder bin first in path
path=("$HOME/.local/bin" $path)

path+=("$HOME/go/bin")
path+=("$HOME/.cargo/bin") # rust
path+=("$HOME/.cabal/bin") # haskell
path+=("$HOME/.ghcup/bin") # haskell
path+=("$HOME/.local/llvm/bin")
path+=(".")

if command -v brew &> /dev/null; then
  eval $(brew shellenv)
  prefix=$(brew --prefix)

  export C_INCLUDE_PATH="${C_INCLUDE_PATH:+${C_INCLUDE_PATH}:}$prefix/include"
  export LIBRARY_PATH="${LIBRARY_PATH:+${LIBRARY_PATH}:}$prefix/lib"
fi

if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

typeset -U path # force path to have only unique values

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi


if command -v nvim &> /dev/null; then
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

if command -v bat &> /dev/null; then
  export PAGER=bat
fi

[[ -r ~/.aliases ]] && source ~/.aliases
