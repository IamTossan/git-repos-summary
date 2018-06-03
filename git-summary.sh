#!/bin/bash

#	git-summary.sh
#
#	This tool is designed to display quickly the status
#	of multiple git repositories which should be helpful
#	to get a quick overview
#
#	usage:
#
#		./git-summary.sh
#			checks repos listed in repos.txt in the current directory
#			if it exists or else
#			checks repos under the current directory
#
#		./git-summary.sh repodir1, repodir2, ...
#			checks repos listed in arguments

cwd=$(pwd)

function printseparator {
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

if [ -e repos.txt ]
then
	folders=$(cat repos.txt)
elif [ $# -eq 0 ]
then
	folders=$(ls -d */)
else
	folders=$@
fi

for folder in $folders; do
	cd "${cwd}/$folder"
	if [ -d "${cwd}/$folder/.git" ]
	then
		printseparator
		echo
		echo "${cwd}/$folder"
		echo
		git status -sb
		echo
	fi
done
