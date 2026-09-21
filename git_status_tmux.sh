#!/bin/bash
cd "$1" 2>/dev/null || exit

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    exit 0
fi

# Fetch status AND branch information using reliable v2 formatting
status=$(timeout 0.5 git status --porcelain=v2 --branch -unormal 2>/dev/null)

# 1. Parse Branch and Tracking Data (v2 layout)
branch=$(echo "$status" | awk '/# branch.head/ {print $3}')

# v2 outputs ahead/behind on a line like: "# branch.ab +1 -0"
# We parse the + (ahead) and - (behind) values, stripping the sign symbols
ahead=$(echo "$status" | awk '/# branch.ab/ {sub(/\+/,"",$3); print $3}')
behind=$(echo "$status" | awk '/# branch.ab/ {sub(/-/,"",$4); print $4}')

# 2. Parse File Changes & Conflicts
# Filter out the informational comment blocks (# ) to calculate file changes
file_changes=$(echo "$status" | grep -v '^#')

# ripgrep outputs nothing on zero matches; || echo 0 ensures a safe mathematical fallback
conflicts=$(echo "$file_changes" | rg -c '^(u|aa|dd)' || echo 0)
staged=$(echo "$file_changes"    | rg -c '^1 [AMDR]' || echo 0)
unstaged=$(echo "$file_changes"  | rg -c '^1 .[MDR]' || echo 0)
untracked=$(echo "$file_changes" | rg -c '^\?' || echo 0)

stashes=$(git stash list 2>/dev/null | wc -l | tr -d ' ')

# 3. Assemble Output
output="#[fg=#000000,reverse]#[noreverse]#[bg=#000000,fg=#129f0f]  $branch#[fg=#ff0000]"

# Append upstream indicators (only display if greater than 0)
upstream=""
[ -n "$ahead" ]  && [ "$ahead" -gt 0 ]  && upstream="${upstream}⇡${ahead}"
[ -n "$behind" ] && [ "$behind" -gt 0 ] && upstream="${upstream}⇣${behind}"
[ -n "$upstream" ] && output="${output} ${upstream}"

# Append local modifications & merge conflict alerts
flags=""
if [ "$conflicts" -gt 0 ]; then
    # High visibility red alert flag for merge conflicts
    flags="${flags}${conflicts}="
fi

[ "$staged"    -gt 0 ] && flags="${flags}${staged}+"
[ "$unstaged"  -gt 0 ] && flags="${flags}${unstaged}!"
[ "$untracked" -gt 0 ] && flags="${flags}${untracked}?"
[ "$stashes"   -gt 0 ] && flags="${flags}${stashes}\$"

if [ -n "$flags" ]; then
    echo -e "${output} [${flags}]"
else
    echo -e "${output}"
fi
