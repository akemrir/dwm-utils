#!/bin/sh -eu

if [ -z "${HOME-}" ]; then
	echo 'docsmenu: $HOME not set' >&2
	exit 1
fi

exec fmenu "$HOME/docs" -p 'Open document:' -r -i -F -s "$@"
