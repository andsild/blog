#!/usr/bin/env bash
# https://github.com/docker-library/official-images#consistency

set -e

# this if will check if the first argument is a flag
# but only works if all arguments require a hyphenated flag
# -v; -SL; -f arg; etc will work, but not arg1 arg2
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    set -- cabal run my-site watch -- "$@"
fi

# check for the expected command...kind of
if [ "$1" = 'watch' ]; then
    exec gosu stack exec site clean -- "$@"
    exec gosu stack exec site watch -- "$@"
fi

# else default to run whatever the user wanted like "bash" or "sh"
exec "$@"
