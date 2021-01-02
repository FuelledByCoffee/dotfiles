#!/usr/bin/env zsh
# vim:foldmethod=marker:ft=zsh

#: Aliases {{{
[[ -r ~/.aliases ]] && source ~/.aliases

alias edprof='nvim ~/.zshrc && source ~/.zshrc'
#: }}}

#: Functions {{{
function chpwd {
  emulate -L zsh
  ls
}

function mcd {
  emulate -L zsh
  mkdir -p $1 && cd $1
}

function ql {
  emulate -l zsh
  qlmanage -p $@ >& /dev/null
}

# Hide folder in finder
hide () {
  if [[ -d $1 ]] ; then
    chflags hidden $1
  else
    echo "Invalid argument"
  fi
}

# Unhide folder in finder
show () {
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
autoload -Uz vcs_info
setopt promptsubst

#local branch=''
#local lock=''

# Vi mode
INSERT='%F{blue}%S INSERT %s%f'
NORMAL='%F{green}%S NORMAL %s%f'
VISUAL='%F{yellow}%S VISUAL %s%f'
REPLACE='%F{red}%K{white}%S REPLACE %s%f%k'

# Short delay after pressing escape -- 20 looks like the sweet spot
KEYTIMEOUT=40
NEWLINE=$'\n'

function zle-line-init zle-keymap-select {
  case $KEYMAP in
    (vicmd)         MODE=$NORMAL ;;
    (viins|main)    MODE=$INSERT ;;
  esac

  PROMPT="%(!.%B%F{red}%n%f%b:.)%F{yellow}%~%f $MODE "
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

RPROMPT='%(?..%B%F{red}❌ %?%f%b)'
#: }}}

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

FPATH=usr/local/share/zsh-completions:$FPATH

autoload -Uz compinit
compinit
#: }}}

#: History {{{
setopt appendhistory
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#: }}}

#: Options {{{
setopt autocd beep extendedglob menu_complete
unsetopt nomatch notify
#: }}}

#: Plugins {{{
source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh-hist/zsh-hist.plugin.zsh
#source ~/.zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#: }}}
