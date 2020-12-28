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
    rd="\[\e[0;31m\]"	# Red
    gr="\[\e[0;32m\]"	# Green
    yl="\[\e[0;33m\]"	# Yellow
    bl="\[\e[0;34m\]"	# Blue
    mg="\[\e[0;35m\]"	# Magentae
    cy="\[\e[0;36m\]"	# Cyan

    brd="\[\e[1;31m\]"	# Bold Red
    bgr="\[\e[1;32m\]"	# Bold Green
    byl="\[\e[1;33m\]"	# Bold Yellow
    bbl="\[\e[1;34m\]"	# Bold Blue
    bmg="\[\e[1;35m\]"	# Bold Magentae
    bcy="\[\e[1;36m\]"	# Bold Cyan

    no="\[\e[0m\]"	# Normal

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
    export PS1="[${userClr}\u${no}@${hostClr}\h ${bl}\W${no}]\\$ "
    export PS2="> "
#   Reset the path each time the terminal is launched. Add furter directories here.

#   ------------------------------------------------------------------
    PATH="$PATH:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin"
    PATH="$PATH:/Library/Developer/CommandLineTools/usr/bin"
    PATH="$PATH:$HOME/Library/Python/3.8/bin"
    PATH="$PATH:."
    export PATH

#   Adds gnu manuals to man search
#   ------------------------------------------------------------------
#   export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

#   Custom colors
#   ------------------------------------------------------------------
    export CLICOLOR=1	# I'll never understand how some people can work in mono-bit color
    export TERM="xterm-256color"    # So many colors

#   Add and define colors and options for ls
#   ------------------------------------------------------------------
#   export LSCOLORS="exfxcxdxBxegedabagacad"            # For BSD and mac
    export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31"    # For Linux
    export QUOTING_STYLE="literal"                      # Don't put names with spaces in quotes

#   Set vim as the default editor and viewer of textfiles
#   ------------------------------------------------------------------
    export EDITOR="nvim"
    export VISUAL="nvim"

#   For using the swift package manager.
#   ------------------------------------------------------------------
    export TOOLCHAINS="swift"

#   Open man pages in vim instead of less
#   Adds a few binds that make vim behave more like less
#   ------------------------------------------------------------------
    export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    	nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    	-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    	-c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#   Set language to american english
#   ------------------------------------------------------------------
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LANGUAGE=en_US.UTF-8

#   Set language to british english
#   ------------------------------------------------------------------
#   export LANG=en_GB.UTF-8
#   export LC_ALL=en_GB.UTF-8
#   export LANGUAGE=en_GB.UTF-8

#   Set language to Norwegian bokmål
#   ------------------------------------------------------------------
#   export LANG=no_NO.UTF-8
#   export LC_ALL=no_NO.UTF-8
#   export LANGUAGE=no_NO.UTF-8

#   Load automatic completion for bash
    if [ -f /usr/local/etc/bash_completion.d ]; then
    	. /usr/local/etc/bash_completion.d
    fi

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
    [[ -r .aliases ]] && source .aliases

    alias shortPS1='PS1=${userClr}\$\ ${no}'

#   ------------------------------------------------------------------
#   alias manpath="echo -e '${MANPATH//:/\\n}'"

#   Aliases to make it easy to edit and load .bash_profile from anywhere
#   ------------------------------------------------------------------
    alias reload="source ~/.bash_profile" 	# Source bashrc
    alias edprof="nvim ~/.bash_profile" 		# Edit bashrc


#   ------------------------------------------------------------------
#   Compilers and interpreters
#   ------------------------------------------------------------------

#	  Flags
#   ------------------------------------------------------------------
    export CFLAGS="-Wall -Wextra -Wshadow -std=c17"
    export CXXFLAGS="-Wall -Wextra -Wshadow -std=c++17"
    export CPPFLAGS=""
    export LDFLAGS=""
    export LDLIBS=""

#   Python
#   ------------------------------------------------------------------
    alias py="python3"
    complete -f py

#   ------------------------------------------------------------------
#   Utilities
#   ------------------------------------------------------------------

    alias softwareupdate="softwareupdate -l &>/dev/null"

#   Homebrew
#   ------------------------------------------------------------------
    alias update="brew update && brew upgrade"      # Full update
    alias berw="brew"                               # Hey we all make mistakes
    alias bewr="brew"                               # Many mistakes

#   Git     wow, such commit, very push
#   ------------------------------------------------------------------
    alias wow="git status"     # -u: Untracked files no: None
    alias such="git"
    alias very="git"

#   Vim
#   ------------------------------------------------------------------
    alias vi="vim"

#   Other shells
#   ------------------------------------------------------------------
    # alias powershell="pwsh"


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
