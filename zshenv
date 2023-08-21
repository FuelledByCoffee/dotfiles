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

unset CPPFLAGS
unset LDFLAGS

export CPATH="${CPATH:-HOME/.local/include}"
export LIBRARY_PATH="${LIBRARY_PATH:-/usr/lib:/usr/local/lib:$HOME/.local/lib}"

if [[ -d "$HOME/.local/llvm" ]]; then
  llvm_install_dir="$HOME/.local/llvm"
fi

if [[ -n $llvm_install_dir ]]; then
  export CPPFLAGS="${CPPFLAGS:+${CPPFLAGS} }-I$llvm_install_dir/include"
  export LDFLAGS="${LDFLAGS:+${LDFLAGS} }-L$llvm_install_dir/lib -Wl,-rpath,$llvm_install_dir/lib"
  export LDFLAGS="${LDFLAGS:+${LDFLAGS} }-lc++ -lc++abi"
  path+=($llvm_install_dir/bin)
fi

export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"

# CLI
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31' # For Linux
export QUOTING_STYLE='literal' # Don't put names with spaces in quotes

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$ZDOTDIR/.zsh-syntax-highlighting/highlighters"


# Put home folder bin first in path
path=($HOME/.local/bin $path)

path+=($HOME/.cargo/bin) # rust
path+=(.)

brewbin="/home/linuxbrew/.linuxbrew/bin"
if [[ -d $brewbin && $PATH != "*$brewbin*" ]] ; then
  PATH="$brewbin${PATH:+:${PATH}}"
elif [[ ! "$PATH" == "*/opt/homebrew/bin*" ]]; then
  path+=(/opt/homebrew/bin)
fi

if hash brew 2> /dev/null; then
  eval $(brew shellenv)
  prefix=$(brew --prefix)

  export LIBRARY_PATH="${LIBRARY_PATH:+${LIBRARY_PATH}:}$prefix/lib"

  export CPPFLAGS="${CPPFLAGS:+${CPPFLAGS} }-isystem $prefix/include"
  export LDFLAGS="${LDFLAGS:+${LDFLAGS} }-L$prefix/lib -Wl,-rpath,/home/linuxbrew/.linuxbrew/lib"
fi

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

typeset -U path # force path to have only unique values


if hash thefuck 2> /dev/null; then
  eval $(thefuck --alias)
fi


if hash zoxide  2> /dev/null; then
  eval "$(zoxide init zsh)"
fi


if hash bat 2> /dev/null; then
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
