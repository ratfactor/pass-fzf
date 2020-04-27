#!/bin/bash

# Forked from pass-fzf by Saggi Mizrahi
# https://github.com/ficoos/pass-fzf

# This pass-fzf fork by Dave Gauer
# https://github.com/ratfactor/pass-fzf

function path2entry() {
	local v=$1
	v=${v#$PREFIX/}
	v=${v%.gpg}
	echo -n "$v"
}

function candidate_selector_fzf() {
	candidates=$1
	echo "$candidates" | fzf --select-1
}

function list_entries() {
	find "$PREFIX" -name '*.gpg' | while read -r c; do
		echo $(path2entry "$c");
	done
}

cmds="$@"
candidates=$(list_entries)

res=$(candidate_selector_fzf "$candidates")
if [ -n "$res" ]; then
	pass $cmds "$res"
else
	exit 1
fi

