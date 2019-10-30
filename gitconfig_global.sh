#!/bin/bash

echo -e "\e[32mApplying settings...\e[0m"

# log alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

# color enabling settings
git config --global	color.diff true
git config --global	color.status true
git config --global	color.branch true
git config --global	color.interactive true

# core settings
git config --global	core.excludesfile ~/.gitexcludes
git config --global core.ignorecase false

### default pull and push
# upstream - push the current branch to its upstream branch...
# simple - like upstream, but refuses to push if the upstream branch’s name is different from the local one...
# current - push the current branch to a branch of the same name.
###

git config --global	pull.default upstream
git config --global push.default upstream

T_EDITOR=${EDITOR:=emacs -nw}
git config --global	core.editor "$T_EDITOR"

# print all settings
git --no-pager config --list

# example configuring gitlabs usage for 'go get'
# git config --global url."git@some.addr.com:".insteadOf "https://some.addr.com/"
