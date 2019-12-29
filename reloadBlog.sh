#!/usr/bin/env bash

set -xe

cd /home/dev/blog/
git clean -f
git fetch --all
git reset --hard origin/master
cd /home/dev/blog/my-site
sudo service qwde-blog stop
cabal build
./dist/build/site/site clean
./dist/build/site/site build
sudo service qwde-blog start
