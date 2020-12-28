#!/usr/bin/env zsh
# vim:foldmethod=marker

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
path+=("/Library/Developer/CommandLineTools/usr/bin")
path+=("/usr/local/opt/llvm/bin")
path+=("$HOME/Library/Python/3.9/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.local/sbin")
path+=("$HOME/bin")
path+=(".")

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
export CC='clang'
export CXX='clang++'
export CFLAGS='-WCL4 -Wshadow -std=gnu17'
export CXXFLAGS='-WCL4 -Wshadow -std=c++17'
export LDFLAGS='-flto=thin'

# CLI
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31' # For Linux
export QUOTING_STYLE='literal' # Don't put names with spaces in quotes
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

if [[ "$OSTYPE" == "darwin"* ]]; then
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR='/usr/local/share/zsh-syntax-highlighting/highlighters'
elif [[ "$OSTYPE" == "linux"* ]]; then
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR='/usr/share/zsh-syntax-highlighting/highlighters'
fi
