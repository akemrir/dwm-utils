#!/bin/sh -eu

if [ -z "${HOME-}" ]; then
	echo 'videomenu: $HOME not set' >&2
	exit 1
fi

exec fmenu "$HOME/video" -p 'Open video:' -r -i -F -s "$@"
