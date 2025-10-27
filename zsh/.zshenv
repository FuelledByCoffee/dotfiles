# vim: expandtab sw=2
export XDG_CONFIG_HOME="$HOME/.config"
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
  export CPPFLAGS="-isystem $HOME/.local/include${CPPFLAGS:+ $CPPFLAGS}"
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

if hash clang 2> /dev/null && [[ -d /usr/lib/llvm-20 && -z $SET_LLVM ]]; then
  export SET_LLVM="true"
  export CC="clang"
  export CXX="clang++"
  export CPPFLAGS="${CPPFLAGS:+$CPPFLAGS }-isysroot /usr/lib/llvm-20"
  export CXXFLAGS="${CXXFLAGS:+$CXXFLAGS }-nostdlib++ -stdlib=libc++ -isystem /usr/lib/llvm-20/include/c++/v1"
  export LDFLAGS="${LDFLAGS:+$LDFLAGS }-nostdlib++ -stdlib=libc++ -lc++ -lc++abi -lunwind"
  export LDFLAGS="${LDFLAGS:+$LDFLAGS }-L/usr/lib/llvm-20/lib -Wl,-rpath,/usr/lib/llvm-20/lib"
  export LIBRARY_PATH="${LIBRARY_PATH:+$LIBRARY_PATH:}/usr/lib/llvm-20/lib"
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}/usr/lib/llvm-20/lib"
  export CLANG_DEFAULT_CXX_STDLIB="libc++"

  if hash ld.lld 2> /dev/null; then
    export LDFLAGS="${LDFLAGS:+$LDFLAGS }-fuse-ld=lld"
  fi
fi


if hash brew 2> /dev/null && [[ -z $HOMEBREW_PREFIX ]]; then
  eval $(brew shellenv)

  export LIBRARY_PATH="${LIBRARY_PATH:+$LIBRARY_PATH:}$HOMEBREW_PREFIX/lib"

  export CPPFLAGS="${CPPFLAGS:+$CPPFLAGS }-isystem $HOMEBREW_PREFIX/include"
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$HOMEBREW_PREFIX/lib"
  export LDFLAGS="${LDFLAGS:+$LDFLAGS }-L$HOMEBREW_PREFIX/lib -Wl,-rpath,$HOMEBREW_PREFIX/lib"
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
