#!/bin/bash
cd "$1" 2>/dev/null || exit

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    exit 0
fi

# Fetch status AND branch information
status=$(timeout 0.5 git status --porcelain --branch -unormal 2>/dev/null)

# 1. Parse Branch and Tracking Data
branch_line=$(echo "$status" | head -n 1)
branch=$(echo "$branch_line" | sed -E 's/^## ([^. ]+).*/\1/')

ahead=$(echo "$branch_line" | rg -oE 'ahead [0-9]+' | awk '{print $2}')
behind=$(echo "$branch_line" | rg -oE 'behind [0-9]+' | awk '{print $2}')

# 2. Parse File Changes & Conflicts
file_changes=$(echo "$status" | tail -n +2)

# ripgrep outputs nothing on zero matches; || echo 0 ensures a safe mathematical fallback
conflicts=$(echo "$file_changes" | rg -c '^(U.|.U|AA|DD)' || echo 0)
staged=$(echo "$file_changes" | rg -c '^[AMDR]' || echo 0)
unstaged=$(echo "$file_changes" | rg -c '^.[MDR]' || echo 0)
untracked=$(echo "$file_changes" | rg -c '^\?\?' || echo 0)

stashes=$(git stash list 2>/dev/null | wc -l | tr -d ' ')

# 3. Assemble Output
output="#[fg=#129f0f] $branch"

# Append upstream indicators
upstream=""
[ -n "$ahead" ]    && upstream="${upstream}#[fg=#dd00df]⇡${ahead}"
[ -n "$behind" ]   && upstream="${upstream}#[fg=#ff0055]⇣${behind}"
[ -n "$upstream" ] && output="${output} ${upstream}"

# Append local modifications & merge conflict alerts
flags=""
if [ "$conflicts" -gt 0 ]; then
    # High visibility red alert flag for merge conflicts
    flags="${flags}#[fg=#ff0000,reverse,bold] ${conflicts}= #[noreverse,none]"
fi

[ "$staged"    -gt 0 ] && flags="${flags}#[fg=#00df00]${staged}+"
[ "$unstaged"  -gt 0 ] && flags="${flags}#[fg=#DAA520]${unstaged}!"
[ "$untracked" -gt 0 ] && flags="${flags}#[fg=#00cded]${untracked}?"
[ "$stashes"   -gt 0 ] && flags="${flags}#[fg=#b58900]${stashes}\$"

if [ -n "$flags" ]; then
    echo -e "${output} #[fg=#ff0000][#[default]${flags}#[fg=#ff0000]]#[default]"
else
    echo -e "${output}#[default]"
fi
