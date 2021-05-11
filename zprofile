# vim: ft=bash

# Reset path
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

if [[ "$OSTYPE" == "linux"* ]]; then
  path=("/home/linuxbrew/.linuxbrew/sbin" $path)
  path=("/home/linuxbrew/.linuxbrew/bin"  $path)
elif [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $(uname -m) == "arm64"* ]]; then
    path=("/opt/homebrew/sbin" $path)
    path=("/opt/homebrew/bin"  $path)
  fi
  path+=("/Library/Developer/CommandLineTools/usr/bin")
  path+=("$HOME/Library/Python/3.9/bin")
  path+=("$HOME/Library/Python/3.8/bin")
fi

# Put home folder bin dirs first in path
path=("$HOME/.local/bin"  $path)

path+=("$HOME/go/bin")
path+=("$HOME/.cargo/bin")
path+=(".")

if command -v nvim &> /dev/null; then
  export VISUAL='nvim'
else
  export VISUAL='vim'
fi
export EDITOR=$VISUAL
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
  $VISUAL -R \
  -c 'set ft=man nomod nolist' \
  -c 'map q :q<CR>' \
  -c 'map <SPACE> <C-D>'\
  -c 'map b <C-U>' \
  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

[[ -r ~/.aliases ]] && source ~/.aliases
alias edprof="nvim $ZDOTDIR/.zshrc && source $ZDOTDIR/.zshrc"

