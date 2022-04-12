#   --------------------
#       bash_profile
#   --------------------


#   ---------------------------------
#       Environment configuration
#   ---------------------------------

#   Customize prompt
#   ------------------------------------------------------------------

#   Color stuff
#   ------------------------------------------------------------------
    rd="\[\e[0;31m\]"   # Red
    gr="\[\e[0;32m\]"   # Green
    yl="\[\e[0;33m\]"   # Yellow
    bl="\[\e[0;34m\]"   # Blue
    mg="\[\e[0;35m\]"   # Magenta
    cy="\[\e[0;36m\]"   # Cyan

    brd="\[\e[1;31m\]"  # Bold Red
    bgr="\[\e[1;32m\]"  # Bold Green
    byl="\[\e[1;33m\]"  # Bold Yellow
    bbl="\[\e[1;34m\]"  # Bold Blue
    bmg="\[\e[1;35m\]"  # Bold Magenta
    bcy="\[\e[1;36m\]"  # Bold Cyan

    no="\[\e[0m\]"  # Normal

#   Set colours depending on host and user state.
#   ------------------------------------------------------------------
    if (( EUID == 0 )); then
        userClr=$rd     # If user is root: set colour to red.
    else
        userClr=$bgr     # Else: set user colour to green.
    fi

    if [ -n "$SSH_CONNECTION" ]; then
        hostClr=$cy     # If remote ssh connection: show host as cyan.
    else
        hostClr=$bgr     # Else: show host as green.
    fi

#   Get local host name. Using \h tends to replace the local name with an ip.
#   ------------------------------------------------------------------
#   host=$(scutil --get ComputerName)

#   And finally, export the prompt.
#   ------------------------------------------------------------------
#   export PS1="[${userClr}\u${no}@${hostClr}\h ${bl}\W${no}]\\$ ${no}"
    export PS1="\W${no} \\$ "
    export PS2="> "

#   Add directories to path
#   ------------------------------------------------------------------
    PATH="${PATH:+${PATH}:}."

#   Adds gnu manuals to man search
#   ------------------------------------------------------------------
#   export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

#   Add and define colors and options for ls
#   ------------------------------------------------------------------
#   export LSCOLORS="exfxcxdxBxegedabagacad"            # For BSD and mac
    export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31"    # For Linux
    export QUOTING_STYLE="literal"                      # Don't put names with spaces in quotes

#   Set vim as the default editor and viewer of textfiles
#   ------------------------------------------------------------------
    export EDITOR="vim"
    export VISUAL="vim"

#   Open man pages in $VISUAL which hopefully is either vim or neovim
#   Adds a few binds that make vim behave more like less
#   ------------------------------------------------------------------
    export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
        $VISUAL -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
        -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
        -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#   Set language to american english
#   ------------------------------------------------------------------
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LANGUAGE=en_US.UTF-8

#   Use vi mode in bash. Press escape to enter command mode
#   ------------------------------------------------------------------
    set -o vi

#   Shell options
#   ------------------------------------------------------------------
    shopt -s cdable_vars    # Go to directory containing file if not a directory
    shopt -s dirspell       # Perform automatic correction on tab
    shopt -s cdspell        # Auto spell correct for dir change
    shopt -s autocd         # Command name that is a directory will be inferred as cd to dir
    shopt -s checkwinsize   # Check the size after each command, update the values of LINES and COLUMNS
    shopt -s extglob        # Extended pattern matching
    shopt -s expand_aliases # Use aliases when not interactive

#   ---------------
#       aliases
#   ---------------
    [[ -r ~/.aliases ]] && source ~/.aliases


#   -----------------
#       Functions
#   -----------------

#   Always list directory contents upon 'cd'
#   $@ to make cd return to $HOME after no argument. $1 stays in current dir.
#   ------------------------------------------------------------------
    cd () {
        builtin cd "$@" && ls
    }

    fbigfiles() {
        find / -type f -size +$1G -ls | sort -k7 -r |head -20
    }

#   Move files to Trash
#   Use standard unaliased version of mv
#   Print partial trace of actions to screen
#   ------------------------------------------------------------------
    delete () {
      for file in $@
      do
        command mv $file ~/.Trash/$(basename $file) && echo "$(basename $file) -> Trash"
      done
    }

#   Makes new Dir and jumps inside
#   ------------------------------------------------------------------
    mcd () {
      mkdir -p "$1" && cd "$1"
    }

    sizeof() {
      stat --printf="%s bytes\n" $@
    }

#   Hide a folder in finder
#   ------------------------------------------------------------------
    hide () {
      if [ -d $1 ] ; then
        chflags hidden $1
      else
        echo "Invalid argument"
      fi
    }

#   Show a folder in finder
#   ------------------------------------------------------------------
    show () {
      if [ -d $1 ] ; then
        chflags nohidden $1
      else
        echo "Invalid argument"
      fi
    }

#   Print routing information like default gateway
#   ------------------------------------------------------------------
    gateway () {
      route -n get default
    }

#   Universal extract command
#   ------------------------------------------------------------------
    extract () {
      if [ -f $1 ] ; then
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

# vim:ft=bash
