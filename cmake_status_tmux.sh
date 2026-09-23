#!/usr/bin/env bash
cd "$1" 2>/dev/null || exit

# Exit if this directory is not a CMake project root
if [ ! -f "CMakeLists.txt" ]; then
    exit 0
fi

cmake_version=$(cmake --version | awk 'NR==1 {print $3}')

# Find the first CMakeCache.txt up to 2 subdirectories deep
cache_file=$(fd -IH --fixed-strings --max-depth 2 "CMakeCache.txt" | head -n 1)

# Only proceed if a CMakeCache.txt file was actually found
if [[ -n "$cache_file" ]]; then
    # Extract the directory containing the cache file
    build_dir=$(dirname "$cache_file")

    # Extract the build type from this specific cache file
    build_types=$(awk -F= '/^CMAKE_BUILD_TYPE:STRING=/ {print $2}' "$cache_file")

    # Fallback to "Default" if CMAKE_BUILD_TYPE is empty (common in Multi-Config generators)
    if [[ -z "$build_types" ]]; then
        build_types="Default"
    fi

    # Print the CMake version and build type matching your tmux style
    echo -n "#[fg=#129fff]cmake v${cmake_version}: $build_types#[default]"

    # Ensure the log exists and contains more than just the header
    if [ -f "$build_dir/.ninja_log" ] && [ $(wc -l < "$build_dir/.ninja_log") -gt 1 ]; then

        # Use awk to parse the file from the bottom up to calculate the last session's duration
        total_seconds=$(tac "$build_dir/.ninja_log" | awk -F'\t' '
            BEGIN { max_end = 0; }
            /^#/ { next } # Skip comment/header lines
            {
                start = $1
                end = $2
                
                # Record the very highest end time (which is the last file finished)
                if (end > max_end) {
                    max_end = end
                }
                
                # If the start time drops to 0, we have reached the beginning 
                # of the most recent build invocation. Stop parsing.
                if (start == 0) {
                    exit
                }
            }
            END { print max_end / 1000 }
        ')

        # Format the output into something clean (e.g., 2m 14s or 4.2s)
        if (( $(echo "$total_seconds > 60" | bc -l) )); then
            minutes=$(echo "$total_seconds / 60" | bc)
            seconds=$(echo "$total_seconds % 60" | bc | awk '{print int($1)}')
            build_time=" (${minutes}m ${seconds}s)"
        else
            build_time=" ($(printf "%.1fs" "$total_seconds"))"
        fi

        build_status=" 🟢$build_time"
    else
        build_status=" ⚪ (Unbuilt)"
    fi

    # Print status on the same line so it fits your status bar seamlessly
    echo "$build_status"
fi
