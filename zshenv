# vim: ft=bash

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
if command -v clang &> /dev/null; then
  export CC="clang"
  export CXX="clang++"
  # export CPPFLAGS=""
  # export CFLAGS=""
  # export CXXFLAGS=""
  # export LDFLAGS=""
  # export LDLIBS=""
  export DBGFLAGS="-g -fsanitize=undefined -fsanitize=address"
elif command -v gcc &> /dev/null; then
  export CC="gcc"
  export CXX="g++"
  # export CFLAGS=""
  # export CXXFLAGS=""
fi

export C_INCLUDE_PATH="$HOME/.local/include:/opt/homebrew/include"
export CPLUS_INCLUDE_PATH="$HOME/.local/include:/opt/homebrew/include"
export LIBRARY_PATH="$HOME/.local/lib:/opt/homebrew/lib"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"

# CLI
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31' # For Linux
export QUOTING_STYLE='literal' # Don't put names with spaces in quotes

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 100% --layout=reverse --border'

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$ZDOTDIR/.zsh-syntax-highlighting/highlighters"
