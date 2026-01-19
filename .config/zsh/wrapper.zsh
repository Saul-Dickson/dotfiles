#!/usr/bin/env zsh

function exa_wrapper() {
	if [ $# -eq 0 ]; then
		exa -alf --color always --icons --group-directories-first
	elif [ $# -eq 1 ] && [ -n $1 ]; then
		exa -alf --color always --icons --group-directories-first "$1"
	else
		exa "$@"
	fi
}
