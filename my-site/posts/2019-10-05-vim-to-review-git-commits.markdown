---
title: Using Vim to review Git Commits
---

The best way to design pull requests is to split up, create small commits and divide into multiple PRs. This makes it easier to  review code, and merging feels safer. Though, arranging code-changes to perfect small PRs and commits takes time, so every now and then a large PR sneaks in.


Normally I use [tig](https://jonas.github.io/tig/) to review code locally and github/gitlab for external PRs. I like these tools, but for larger PRs I feel that I loose context.

I'm slightly addicted to Vim, so the new approach was naturally just using Vim to do reviews. 

<script src="http://gist-it.appspot.com/https://github.com/andsild/dotfiles/blob/master/Bash/viewcommit"></script>

The snippet above takes a given commit, gets all files referenced in that commit, and loads up each file in a separate tab (`vim -p`). After that, I use [vim-fugitive's](https://github.com/tpope/vim-fugitive) `Gedit` to load the file at the given commit, and then a diff versus the file at the previous commit. In the last tab-page I fetch the commit message using `git stat`.

The script can be rewritten to not depend on vim-fugitive, e.g. by checking out git files to a temporary directory and doing a regular vimdiff on those.

If you combine this with a language server (e.g. [coc-java](https://github.com/neoclide/coc-java)), you can now review a commit while having tools like "go to definition" or "see call hierarchy" available. If your vim-foo is up to speed, you can also load up the file at HEAD to make local changes into a new commit if you want to (tip: You can always use `:Gedit %` to load file at HEAD).
