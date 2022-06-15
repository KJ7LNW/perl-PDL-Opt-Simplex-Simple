#!/bin/sh

set -e

git diff
if [ -n "$(git status -s)" ]; then
	echo === GIT is dirty ===
	git status -s
	exit 1
fi

./rebuild-manifest.sh
./repod.sh

perl Makefile.PL && make && make test && make distcheck && make dist
