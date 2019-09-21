#!/usr/bin/env bash

set -xe

cd /home/dev/blog/
git clean -f
git fetch --all
git reset --hard origin/master
stack build && cd /home/dev/blog/my-site
sudo service qwde-blog stop
stack exec site clean
stack exec site build

sudo service qwde-blog start
