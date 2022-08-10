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

export CPATH="${CPATH:-HOME/.local/include}"
export LIBRARY_PATH="${LIBRARY_PATH:-/usr/lib:/usr/local/lib:$HOME/.local/lib}"

if [[ -d /usr/local/llvm ]]; then
  llvm_install_dir="/usr/local/llvm"
elif [[ -d $HOME/.local/llvm ]]; then
  llvm_install_dir="$HOME/.local/llvm"
fi

if [[ -n llvm_install_dir ]]; then
  export LDFLAGS="-Wl,-rpath,$llvm_install_dir/lib"
  export LIBRARY_PATH="$llvm_install_dir/lib${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  export CPATH="$llvm_install_dir/include${CPATH:+:${CPATH}}"

  path+=($llvm_install_dir/bin)
fi

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
path+=(.)

[[ -d /home/linuxbrew/.linuxbrew/bin ]] && path=(/home/linuxbrew/.linuxbrew/bin $path)

if hash brew 2> /dev/null; then
  eval $(brew shellenv)
  prefix=$(brew --prefix)

  export CPATH="${CPATH:+${CPATH}:}$prefix/include"
  export LIBRARY_PATH="${LIBRARY_PATH:+${LIBRARY_PATH}:}$prefix/lib"
  export LDFLAGS="${LDFLAGS:+${LDFLAGS} }-Wl,-rpath,/home/linuxbrew/.linuxbrew/lib"

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
  export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
fi
export EDITOR=$VISUAL

[[ -r ~/.aliases ]] && source ~/.aliases
