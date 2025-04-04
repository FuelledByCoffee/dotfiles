#!/bin/bash

function branch_name() {
	b_name=$(git branch --show-current)
	echo -n $b_name
}


function git_info() {
	inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
	if [ $inside_git_repo ]; then
		echo -n "#[fg=purple]"
		echo -n "  "
		branch_name
	fi
}

function get_cmake_build_type() {
	build_type=$(rg -I -d2 --no-ignore "CMAKE_BUILD_TYPE:STRING=(.+)" -r '$1')
	if [ -n $build_type ]; then
		echo -n " #[fg=blue] "
		echo -n $build_type
	fi
}

function load_average() {
	printf "%s " "$(uptime | awk -F: '{printf $NF}' | tr -d ',')"
}

function main() {
	# load_average
	git_info 
	# get_cmake_build_type
	# load_average
}

main

# vim: ts=2 noexpandtab
