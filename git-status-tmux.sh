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

ahead=$(echo "$branch_line" | grep -oE 'ahead [0-9]+' | awk '{print $2}')
behind=$(echo "$branch_line" | grep -oE 'behind [0-9]+' | awk '{print $2}')

# 2. Parse File Changes & Conflicts
file_changes=$(echo "$status" | tail -n +2)

# Unmerged / Conflicts (Look for U anywhere in the two-letter status)
conflicts=$(echo "$file_changes" | grep -E -c '^(U.|.U|AA|DD)')

staged=$(echo "$file_changes" | grep -c '^[AMDR]')
unstaged=$(echo "$file_changes" | grep -c '^.[MDR]')
untracked=$(echo "$file_changes" | grep -c '^\??')

# 3. Assemble Output
output="#[fg=#129f0f] $branch"

# Append upstream indicators
upstream=""
[ -n "$ahead" ] && upstream="${upstream}#[fg=#00ff00]⇡${ahead}"
[ -n "$behind" ] && upstream="${upstream}#[fg=#ff0055]⇣${behind}"
[ -n "$upstream" ] && output="${output} ${upstream}"

# Append local modifications & merge conflict alerts
flags=""
if [ "$conflicts" -gt 0 ]; then
    # High visibility red alert flag for merge conflicts
    flags="${flags}#[fg=#ff0000,reverse,bold] !${conflicts} #[noreverse,none]"
fi
[ "$staged" -gt 0 ] && flags="${flags}#[fg=#00ff00]●${staged}"
[ "$unstaged" -gt 0 ] && flags="${flags}#[fg=#ffcc00]✚${unstaged}"
[ "$untracked" -gt 0 ] && flags="${flags}#[fg=#ffffff]…${untracked}"

if [ -n "$flags" ]; then
    echo -e "${output} #[fg=#ff0000][#[default]${flags}#[fg=#ff0000]]#[default] "
else
    echo -e "${output}#[default] "
fi
