#!/usr/bin/env bash

set -xe

cd /home/dev/blog/
git clean -f
git fetch --all
git reset --hard origin/master
nix-shell --pure --command "stack build && cd /home/andsild/blog/my-site && stack exec site build"

sudo service qwde-blog restart
