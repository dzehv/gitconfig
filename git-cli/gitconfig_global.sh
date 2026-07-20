#!/bin/bash

echo -e "\033[32mApplying settings...\033[0m"

# master as default branch
git config --global init.defaultBranch master

# color enabling settings
git config --global color.diff true
git config --global color.status true
git config --global color.branch true
git config --global color.interactive true

# core settings
git config --global core.excludesfile ~/.gitexcludes
git config --global commit.template ~/.gitmessage
git config --global core.ignorecase false

# default pull and push
# upstream - push the current branch to its upstream branch
# simple - like upstream, but refuses to push if the upstream branch’s name is different from the local one
# current - push the current branch to a branch of the same name
git config --global pull.default upstream
git config --global push.default upstream

# fetch tags during git fetch to handle tags pushed without branch updates
git config --global --add remote.origin.fetch "+refs/tags/*:refs/tags/*"

# reconcile divergent branches method
git config --global pull.rebase false    # merge only
# git config --global pull.rebase true   # rebase
# git config --global pull.ff only       # fast-forward only

# editor settings
T_EDITOR=${EDITOR:=mg}
git config --global core.editor "$T_EDITOR"
# git config --global core.pager "less"

# standard aliases
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.root 'rev-list --max-parents=0 HEAD'

# forensic aliases
git config --global alias.largest "!f() { git rev-list --objects --all | git cat-file --batch-check='%(objectname) %(objecttype) %(objectsize) %(rest)' | awk '\$2 == \"blob\" {print \$3, \$1, \$4}' | sort -rn | head -n 10 | awk '{split(\"B KB MB GB TB\", u); i=1; s=\$1; while(s>=1024 && i<5){s/=1024; i++}; printf \"%-7.2f %s\\t%s\\t%s\\n\", s, u[i], \$2, \$3}'; }; f"
git config --global alias.largets "!git largest"
git config --global alias.authors "shortlog -sn --all"
git config --global alias.find-deleted "log --diff-filter=D --summary"
git config --global alias.search-commit "log -S"
git config --global alias.reflog-all "log -g --abbrev-commit --pretty=oneline"

# rescue aliases
git config --global alias.undo "reset --soft HEAD~1"
git config --global alias.unstage "reset HEAD --"
git config --global alias.abort "!f() { git merge --abort 2>/dev/null || git rebase --abort 2>/dev/null || git cherry-pick --abort 2>/dev/null || git am --abort 2>/dev/null || echo 'No merge/rebase/cherry-pick/am in progress'; }; f"

# find dangling commits that were lost
git config --global alias.lost-found "!f() { git fsck --lost-found | awk '\$2 == \"commit\" {print \$3}' | xargs -n 1 git log -n 1 --oneline 2>/dev/null; }; f"

# cleanup aliases
git config --global alias.discard "!git reset --hard HEAD && git clean -df"
git config --global alias.wipe "!git reset --hard HEAD && git clean -fdx"
git config --global alias.prune-local "!f() { git branch --merged | grep -v -E '^\*|master|main|develop' | xargs git branch -d 2>/dev/null || echo 'No merged branches to prune'; }; f"
git config --global alias.prune-remote "fetch --prune --all"

# example configuring gitlabs usage for 'go get'
# git config --global url."git@some.addr.com:".insteadof "https://some.addr.com/"

# print all settings
git --no-pager config list
