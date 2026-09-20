#!/bin/bash
# Move to the requested directory safely
cd "$1" 2>/dev/null || exit

# Exit immediately if not inside a Git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    exit 0
fi

# Get the current branch or commit hash
branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

# Fetch status counts rapidly in one pass
status=$(git status --porcelain 2>/dev/null)

# Count changes
staged=$(echo "$status" | grep -c '^[AMDR]')
unstaged=$(echo "$status" | grep -c '^.[MDR]')
untracked=$(echo "$status" | grep -c '^\??')

# Build the output string
output="#[fg=#129fff] $branch"

flags=""
[ "$staged" -gt 0 ] && flags="${flags}#[fg=#00ff00]●${staged}"
[ "$unstaged" -gt 0 ] && flags="${flags}#[fg=#ffcc00]✚${unstaged}"
[ "$untracked" -gt 0 ] && flags="${flags}#[fg=#ffffff]…${untracked}"

if [ -n "$flags" ]; then
    echo -e "${output} (${flags}#[fg=#129fff])#[default] "
else
    echo -e "${output}#[default] "
fi
