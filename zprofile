#!/usr/bin/env zsh

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
path=("/opt/homebrew/bin" $path)
path+=("/Library/Developer/CommandLineTools/usr/bin")
path+=("/usr/local/opt/llvm/bin")
path+=("$HOME/Library/Python/3.8/bin")
path+=("$HOME/Library/Python/3.9/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.local/sbin")
path+=("$HOME/bin")
path+=(".")

if command -v nvim &> /dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
  export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
else
  export EDITOR='vim'
  export VISUAL='vim'
  export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
fi

#: Aliases {{{
[[ -r ~/.aliases ]] && source ~/.aliases

alias edprof='nvim ~/.zshrc && source ~/.zshrc'
#: }}}

