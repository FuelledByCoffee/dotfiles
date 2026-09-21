#!/usr/bin/env bash
cd "$1" 2>/dev/null || exit

# Exit if this directory is not a CMake project root
if [ ! -f "CMakeLists.txt" ]; then
    exit 0
fi

cmake_version=$(cmake --version | awk 'NR==1 {print $3}')

# -I = Search ignored folders (like build/)
# -H = Search hidden folders (like .build/)
# -max-depth 2 = Look exactly up to 1 subdirectory deep relative to here
build_types=$(fd -IH --fixed-strings --max-depth 2 "CMakeCache.txt" -X \
    awk -F= '/^CMAKE_BUILD_TYPE:STRING=/ {print $2}' | sort -u | paste -sd, -)

# Only print if a build type string was successfully pulled out
if [ -n "$build_types" ]; then
    echo "#[fg=${cmake_blue}]#[fg=#fdfdfd,bg=${cmake_blue}] \
		cmake v${cmake_version}: $build_types #[default,fg=${cmake_blue}]#[default]   "
fi
#   
