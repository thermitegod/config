#!/bin/bash
set -o pipefail
shopt -s failglob

cd "${HOME}/.config/spacefm" || exit 1

printf "Before: %s\n\n" "$(du -h "./.git" | tail -n1)"

git gc --aggressive || exit 1

printf "\nAfter: %s\n" "$(du -h "./.git" | tail -n1)"

#End script
exit $?
