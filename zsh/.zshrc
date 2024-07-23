# vim: ft=zsh foldmethod=marker foldlevel=0

#: Completions {{{
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents pwd
zstyle ':completion:*' squeeze-slashes true # cd ~//folder becomes cd ~/folder
zstyle ':completion:*' complete-options true # use '-<tab>' to complete options/flags
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=2 # use menu if more than 2 matches !! Look into fuzzy searching !!
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-compctl false # Disable old completion system
zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache on # use cache to speed up completion
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Plugin completions
fpath=("${ZDOTDIR:-~}/zsh-completions/src" $fpath)
fpath+=(${ZDOTDIR:-~}/.zsh_functions)

autoload -Uz compinit && compinit # -i: ignore insecure directories
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
  objdump -d $1 | $VISUAL -R -M \
    -c 'setf objdump'
}


function dump_intel {
  emulate -L zsh
  objdump -M intel -d $1 | $VISUAL -R -M \
    -c 'setf objdump'
}


function hex {
  emulate -L zsh
  $VISUAL -b \
    -c ':%!xxd' \
    -c 'setf xxd' \
    -c 'map <leader>w :%!xxd -r<cr>:w<cr>:%!xxd<cr>' \
    -c 'map <leader>q :q!<cr>' \
    $@
}


function clean {
  emulate -L zsh
  if [[ -f build.ninja ]]; then
    ninja -t clean
  else
    command make clean
  fi
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
      *.tar)       tar xf     $1  ;;
      *.tbz2)      tar xjf    $1  ;;
      *.tgz)       tar xzf    $1  ;;
      *.tar.*)     tar xf     $1  ;;
      *.bz2)       bunzip2    $1  ;;
      *.rar)       unrar e    $1  ;;
      *.gz)        gunzip     $1  ;;
      *.zip)       unzip      $1  ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7zz e      $1  ;;
      *)     echo "$1 cannot be extracted via extract()" ;;
    esac
  else
    echo "$1 is not a valid file"
  fi
}

#: }}}

#: Prompt {{{

# autoload -Uz colors && colors
# autoload -Uz add-zsh-hook
# autoload -Uz add-zsh-hook-widget
# autoload -Uz vcs_info
# setopt promptsubst

if hash starship 2> /dev/null; then
  eval "$(starship init zsh)"
fi

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
#: }}}

#: History {{{
setopt appendhistory
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#: }}}

#: Options {{{
setopt autocd 
setopt beep 
setopt extendedglob 
setopt menu_complete # jump directly into menu completion

unsetopt nomatch 
unsetopt notify 
#: }}}

#: Plugins {{{
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=none"
#: }}}

#: Bindings {{{
bindkey -v
bindkey -M viins jj vi-cmd-mode # Double tap 'j' to exit insert mode

bindkey '^k' up-history
bindkey '^j' down-history

bindkey '^ ' autosuggest-accept # zsh-autosuggestions

# Shift-tab
# bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^[[Z' reverse-menu-complete
#: }}}
