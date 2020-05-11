#!/bin/sh -eu

if [ -z "${1-}" ]; then
	exit 2
fi

dir="${1-}"
shift

cd -- "$dir"

find -L . -type f | sort | sed 's|^./||' |
dmenu "$@" |
while read -r file; do
	if [ -n "$file" ]; then
		xdg-open "$dir/$file" &
	fi
done
