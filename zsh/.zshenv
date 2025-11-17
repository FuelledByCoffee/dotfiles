# vim: expandtab sw=2
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

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
if [[ "$CPPFLAGS" != *"$HOME/.local/include"* ]]; then
  export CPPFLAGS="-isystem $HOME/.local/include${CPPFLAGS:+ }$CPPFLAGS"
fi
# export LDFLAGS="${LDFLAGS:+$LDFLAGS }-L$HOME/.local/lib -Wl,-rpath,$HOME/.local/lib -Wl,-rpath,/usr/local/lib"

export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=ON
export CMAKE_COLOR_DIAGNOSTICS=true
export CMAKE_INSTALL_PREFIX=$HOME/.local

if [[ -z $HAS_SET_ENV ]]; then
  export HAS_SET_ENV="true"
  export CPATH="${CPATH:+$CPATH:}$HOME/.local/include"
  export LIBRARY_PATH="${LIBRARY_PATH:+$LIBRARY_PATH:}/usr/lib:/usr/local/lib:$HOME/.local/lib"
  export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH:+$DYLD_LIBRARY_PATH:}/usr/lib:/usr/local/lib:$HOME/.local/lib" # :$HOME/Library/Vulkan/macOS/lib
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}/usr/lib:/usr/local/lib:$HOME/.local/lib" # :$HOME/Library/Vulkan/macOS/lib
fi

export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$HOME/.local/lib/pkgconfig"

# CLI
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31' # For Linux
export QUOTING_STYLE='literal' # Don't put names with spaces in quotes

# [[ -f ~/.llvm-config ]] && source ~/.llvm-config

brewbin="/home/linuxbrew/.linuxbrew/bin"
if [[ -d $brewbin && ":$PATH:" != *":$brewbin:"* ]] ; then
  PATH="$brewbin${PATH:+:$PATH}"
elif [[ ! "$PATH" == *":/opt/homebrew/bin:"* ]]; then
  path+=(/opt/homebrew/bin)
fi

if hash clang 2> /dev/null; then
  export CC="clang"
  export CXX="clang++"

  if hash ld.lld 2> /dev/null; then
    export LDFLAGS="${LDFLAGS:+$LDFLAGS }-fuse-ld=lld"
  fi
fi


if hash brew 2> /dev/null && [[ -z $HOMEBREW_PREFIX ]]; then
  eval $(brew shellenv)

  export LIBRARY_PATH="${LIBRARY_PATH:+$LIBRARY_PATH:}$HOMEBREW_PREFIX/lib"

  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$HOMEBREW_PREFIX/lib/pkgconfig"
  export CPPFLAGS="${CPPFLAGS:+$CPPFLAGS }-isystem $HOMEBREW_PREFIX/include"
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$HOMEBREW_PREFIX/lib"
  export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH:+$DYLD_LIBRARY_PATH:}$HOMEBREW_PREFIX/lib"
  export LDFLAGS="${LDFLAGS:+$LDFLAGS }-L$HOMEBREW_PREFIX/lib -Wl,-rpath,$HOMEBREW_PREFIX/lib"

  # Sqlite3
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$HOMEBREW_PREFIX/opt/sqlite/lib/pkgconfig"
  export DYLD_LIBRARY_PATH="$HOMEBREW_PREFIX/opt/sqlite3/lib:$DYLD_LIBRARY_PATH"
fi

# Put home folder bin first in path
path+=($HOME/.cargo/bin) # rust
path=($HOME/.local/bin $path)
path+=(.)

typeset -U path # force path to have only unique values

[[ -e $XDG_CONFIG_HOME/aliases ]] && source $XDG_CONFIG_HOME/aliases
[[ -e $ZDOTDIR/fzf.zsh ]] && source $ZDOTDIR/fzf.zsh

if hash thefuck 2> /dev/null; then
  eval $(thefuck --alias)
fi


if hash zoxide 2> /dev/null; then
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

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=none"


if (( ${+WSL_DISTRO_NAME})); then
  export BROWSER="explorer.exe"
  alias start="explorer.exe"
fi
