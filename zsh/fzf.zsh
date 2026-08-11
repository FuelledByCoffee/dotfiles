# Setup fzf
# ---------
if [[ ":$PATH:" != *":$HOMEBREW_PREFIX/opt/fzf/bin:"* ]]; then
	path+=($HOMEBREW_PREFIX/opt/fzf/bin)
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" 2>/dev/null

# Key bindings
# ------------
source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

# Check if macOS is currently set to dark mode
if defaults read -g AppleInterfaceStyle &>/dev/null; then
	bat_theme="Catppuccin Macchiato"
	fzf_colors="--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
	--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
	--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
else
	bat_theme="Catppuccin Latte"
	fzf_colors="--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
	--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
	--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
fi
bat_preview=" bat --style=numbers --color=always --theme=\"$bat_theme\" --line-range :500"

# Layout & Border Customizations
fzf_visual_style="
  --height 95%
  --layout=reverse
  --border=sharp
  --border-label=' Finder '
  --border-label-pos=2
  --pointer='▶ '
  --margin=1
  --padding=1
  --preview-window='border-sharp'
  $fzf_colors"

export FZF_DIR="$HOMEBREW_PREFIX/opt/fzf"
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="
  $fzf_visual_style
  --prompt='All❯ '
  --bind '?:toggle-preview'
  --bind 'ctrl-f:change-prompt(Files❯ )+reload(fd -t f)'
  --bind 'ctrl-d:change-prompt(Directories❯ )+reload(fd -t d)'
  --bind 'ctrl-r:change-prompt(All❯ )+reload(fd)'
  --bind 'ctrl-e:execute(echo {+} | xargs -o \$VISUAL)'
  --header='C-r reset | C-d Directories | C-f files | C-e edit | ? toggle preview'
  --preview '([[ -f {} ]] && ($bat_preview {} \
  || cat {})) \
  || ([[ -d {} ]] && (tree -C 2> /dev/null {} || ls -p {})) \
  || echo {} 2> /dev/null | head -200'"

# Search for files and folders within the current directory
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS=""
# export FZF_CTRL_R_OPTS="--preview-window=:hidden"
# Syncs your command history search to match your premium visual layout
export FZF_CTRL_R_OPTS="
  --height 95%
  --layout=reverse
  --pointer='▶ '
  --margin=1
  --padding=1
  --prompt='History❯ '
  --header='Press Enter to run | Ctrl-Y to copy command'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --preview 'echo {2..} | $bat_preview -l bash'
  --preview-window='right:50%:wrap'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_ALT_C_OPTS=""

# zoxide
# export _ZO_FZF_OPTS="
#   --height 95%"

# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
function _fzf_compgen_path {
	fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
function _fzf_compgen_dir {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}

# fh - search in your command history and execute selected command
function fh {
	eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) |
		fzf +s --tac --no-preview |
		sed 's/ *[0-9]* *//')
}

# Search for and kill process
function hunt {
	ps -ef |
		fzf --no-preview --bind 'ctrl-r:reload(ps -ef)' --header 'Press CTRL-R to reload' |
		awk '{print $2}' |
		xargs kill -9
}

# Search for environment variable to unset
function rm-env {
	unset $(env |
		fzf --no-preview --bind 'ctrl-r:reload(env)' --header 'Press CTRL-R to reload' |
		sed 's/=.*//')
}

# Search git commits
# https://github.com/rothgar/mastering-zsh/blob/master/docs/helpers/functions.md#interactive-git-diff
function fshow() {
	git log --graph --color=always \
		--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
		fzf --ansi --preview "echo {} \
    | grep -o '[a-f0-9]\{7\}' \
    | head -1 \
    | xargs -I % sh -c 'git show --color=always %'" \
			--bind "enter:execute:
            (grep -o '[a-f0-9]\{7\}' \
                | head -1 \
                | xargs -I % sh -c 'git show --color=always % \
                | less -R') << 'FZF-EOF'
            {}
    FZF-EOF"
}

bindkey '^p' fzf-cd-widget
