#!/usr/bin/env zsh

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
path+=("$HOME/Library/Python/3.8/bin")
path+=("$HOME/Library/Python/3.9/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.local/sbin")
path+=("$HOME/bin")
path+=(".")

if [[ "$OSTYPE" == "linux"* ]]; then
  path=("/home/linuxbrew/.linuxbrew/sbin" $path)
  path=("/home/linuxbrew/.linuxbrew/bin"  $path)
elif [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $(machine) == "x86"* ]]; then
    path=("/Library/Developer/CommandLineTools/usr/bin" $path)
    path=("/usr/local/opt/llvm/bin" $path)
  else
    path=("/opt/homebrew/sbin" $path)
    path=("/opt/homebrew/bin"  $path)
  fi
fi

if command -v nvim &> /dev/null; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi
export VISUAL=$EDITOR
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
  $EDITOR -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
  -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#: Aliases {{{
[[ -r ~/.aliases ]] && source ~/.aliases

alias edprof='nvim ~/.zshrc && source ~/.zshrc'
#: }}}
