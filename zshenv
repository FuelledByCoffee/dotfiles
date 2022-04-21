export ZDOTDIR=$HOME

# Encoding
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="nb_NO.UTF-8"

# Programming
if hash clang 2> /dev/null; then
  export CC="clang"
  export CXX="clang++"
fi

export CPATH="$HOME/.local/include"
export LIBRARY_PATH="$HOME/.local/lib"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"

# CLI
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31' # For Linux
export QUOTING_STYLE='literal' # Don't put names with spaces in quotes

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$ZDOTDIR/.zsh-syntax-highlighting/highlighters"


# Put home folder bin first in path
path=($HOME/.local/bin $path)

path+=($HOME/go/bin)
path+=($HOME/.cargo/bin) # rust
path+=($HOME/.cabal/bin) # haskell
path+=($HOME/.ghcup/bin) # haskell
path+=($HOME/.local/llvm/bin)
path+=(.)

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
  export MANPAGER="/bin/bash -c \"col -b -x \
    | vim -R --not-a-term \
      -c 'set ft=man' \
      - \""
fi
export EDITOR=$VISUAL

[[ -r ~/.aliases ]] && source ~/.aliases
