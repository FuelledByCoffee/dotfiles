# vim: ft=zsh foldmethod=marker foldlevel=0

#: Completions {{{
# Plugin completions
fpath=("${ZDOTDIR:-~}/zsh-completions/src" $fpath)
fpath+=(${ZDOTDIR:-~}/.zsh_functions)

autoload -Uz compinit && compinit # -i: ignore insecure directories

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
zstyle ':completion:*' use-cache true # use cache to speed up completion
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' insert-unambiguous
zstyle ':completion:*' insert-space true
zstyle ':completion:*:*:cp:*' file-sort modification reverse

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
function print_env {
  echo -e "${1//$2/\\n}"
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
      *.tar.xz)    tar xf     $1  ;;
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

# autoload -Uz colors zsh/terminfo && colors
# autoload -Uz add-zsh-hook
# autoload -Uz add-zsh-hook-widget
# autoload -Uz vcs_info
# setopt promptsubst

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git hg
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{${fg[green]}%}%s%{${fg[cyan]}%}][%{${fg[blue]}%}%r/%S%%{${fg[cyan]}%}][%{${fg[blue]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[cyan]}%}]%{$reset_color%}"
#
# setprompt() {
#   setopt prompt_subst
#
#   if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
#     p_host='%F{yellow}%M%f'
#   else
#     p_host='%F{green}%M%f'
#   fi
#
#   PS1=${(j::Q)${(Z:Cn:):-$'
#     %F{cyan}[%f
#     %(!.%F{red}%n%f.%F{green}%n%f)
#     %F{cyan}@%f
#     ${p_host}
#     %F{cyan}][%f
#     %F{blue}%~%f
#     %F{cyan}]%f
#     %(!.%F{red}%#%f.%F{green}%#%f)
#     " "
#   '}}
#
#   PS2=$'%_>'
#   RPROMPT=$'${vcs_info_msg_0_}'
# }
# setprompt

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

#: Bindings {{{
bindkey -v
bindkey -M viins jj vi-cmd-mode # Double tap 'j' to exit insert mode

bindkey '^k' up-history
bindkey '^j' down-history

bindkey '^ ' autosuggest-accept # zsh-autosuggestions

# Shift-tab
# bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^[[Z' reverse-menu-complete

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
#: }}}

#: Plugins {{{
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=none"

source $ZDOTDIR/completions/zsh-completions.plugin.zsh
source $ZDOTDIR/autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/syntax-highlighting/zsh-syntax-highlighting.zsh
#: }}}
