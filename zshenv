# vim:foldmethod=marker
# shellcheck shell=bash

export ZDOTDIR="$HOME/.config/zsh"

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
  export CPPFLAGS=""
  export CFLAGS="-WCL4 -Wshadow -std=gnu17"
  export CXXFLAGS="-WCL4 -Wshadow -std=c++17"
  export LDFLAGS="-flto=thin"
  export DBGFLAGS="-g -fsanitize=undefined -fsanitize=address"
elif command -v gcc &> /dev/null; then
  export CC="gcc"
  export CXX="g++"
  # export CPPFLAGS="-I $HOME/.local/include"
  export CFLAGS="-Wall -Wextra -Wshadow -std=gnu17"
  export CXXFLAGS="-Wall -Wextra -Wshadow -std=c++17"
  # export LDFLAGS="-flto=thin"
  # export DBGFLAGS="-g -fsanitize=undefined -fsanitize=address"
fi

export C_INCLUDE_PATH="$HOME/.local/include"
export CPLUS_INCLUDE_PATH="$HOME/.local/include"
export LIBRARY_PATH="$HOME/.local/lib"
export LD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib/:$HOME/.local/lib"
export DYLD_FALLBACK_LIBRARY_PATH="$HOME/.local/lib"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"

# I dont't think these do anything?
export CMAKE_C_STANDARD=17
export CMAKE_EXPORT_COMPILE_COMMANDS=true
export CMAKE_C_FLAGS_DEBUG=$DBGFLAGS
export CMAKE_CXX_FLAGS_DEBUG=$DBGFLAGS

# CLI
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31' # For Linux
export QUOTING_STYLE='literal' # Don't put names with spaces in quotes

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$ZDOTDIR/.zsh-syntax-highlighting/highlighters"
