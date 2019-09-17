#!/usr/bin/env bash

set -xe

nix-shell --pure --command "cd /home/andsild/blog/my-site && stack exec site watch"
