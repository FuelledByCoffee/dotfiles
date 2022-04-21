# vim: ft=zsh foldmethod=marker foldlevel=0

#: Completions {{{
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Plugin completions
fpath=("~/dotfiles/zsh-completions/src" $fpath)

autoload -Uz compinit
compinit -i # -i: ignore insecure directories
#: }}}

#: Functions {{{

function chpwd {
  emulate -L zsh
  ls
}


cdl () {
  emulate -L zsh
  cd "$(dirname "$(readlink "$1")")";
}


# Print one directory per line
function ppath {
  echo -e "${PATH//:/\\n}"
}


function pmanpath {
  echo -e "${MANPATH//:/\\n}"
}


function dump {
  emulate -L zsh
  objdump -d $1 | $VISUAL -R \
    -c 'setf asm' \
    -c 'map q :q!<cr>'
}


function clean {
  emulate -L zsh
  if [[ -f build.ninja ]]; then
    ninja -t clean
  else
    command make clean
  fi
}


function hex {
  emulate -L zsh
  $VISUAL -b \
    -c ':%!xxd' \
    -c 'setf xxd' \
    -c 'map ,q :q!<cr>' \
    -c 'map ,w :%!xxd -r<cr> :w<cr> :%!xxd<cr>' \
    $@
}

function mcd {
  emulate -L zsh
  mkdir -p $1 && cd $1
}


function ql {
  emulate -l zsh
  qlmanage -p $@ &>/dev/null
}

# Hide folder in finder
function hide () {
  if [[ -d $1 ]] ; then
    chflags hidden $1
  else
    echo "Invalid argument"
  fi
}

# Unhide folder in finder
function show () {
  if [[ -d $1 ]] ; then
    chflags nohidden $1
  else
    echo "Invalid argument"
  fi
}

function extract () {
  if [[ -f $1 ]] ; then
    case $1 in
      *.tar.bz2)   tar xjf    $1  ;;
      *.tar.gz)    tar xzf    $1  ;;
      *.tar.*)     tar xf     $1  ;;
      *.bz2)       bunzip2    $1  ;;
      *.rar)       unrar e    $1  ;;
      *.gz)        gunzip     $1  ;;
      *.tar)       tar xf     $1  ;;
      *.tbz2)      tar xjf    $1  ;;
      *.tgz)       tar xzf    $1  ;;
      *.zip)       unzip      $1  ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x       $1  ;;
      *)     echo "$1 cannot be extracted via extract()" ;;
    esac
  else
    echo "$1 is not a valid file"
  fi
}

#: }}}

#: Prompt {{{

bindkey -v
bindkey -M viins jj vi-cmd-mode # Double tap 'j' to exit insert mode

autoload -Uz colors && colors
autoload -Uz add-zsh-hook
autoload -Uz add-zsh-hook-widget
autoload -Uz vcs_info
setopt promptsubst

#: Powerlineglyphs {{{
#                                        
#: }}}

# Vi mode
# viinsert='%F{blue}%S I %s%f'
# vicommand='%F{green}%S N %s%f'
# vivisual='%F{yellow}%S V %s%f'
# vireplace='%F{red}%S %K{white}R%k %s%f'

# KEYTIMEOUT=40
# NEWLINE=$'\n'

# function zle-line-init zle-keymap-select {
#   case $KEYMAP in
#     (vicmd)
#       if (( REGION_ACTIVE )); then
#         MODE=$vivisual
#       else
#         MODE=$vicommand
#       fi
#       ;;
#     (viins|main)  MODE=$viinsert  ;;
#   esac

#   PROMPT="%(!.%B%F{red}%n%f%b:.)%F{yellow}%~%f $MODE "
#   zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select
# zle -N zle-line-pre-redraw

# RPROMPT='%(?..%B%F{red}❌ %?%f%b)'
eval "$(starship init zsh)"
# eval "$(oh-my-posh --init --shell zsh --config $(brew --prefix oh-my-posh)/themes/half-life.omp.json)"
#: }}}

#: History {{{
setopt appendhistory
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#: }}}

#: Options {{{
setopt autocd beep extendedglob HIST_IGNORE_DUPS
unsetopt nomatch notify menu_complete
#: }}}

#: Plugins {{{
source $ZDOTDIR/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/.zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=none"
#: }}}
