#!/bin/sh

echo "\e[32mApplying settings...\e[0m"

# Log alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

# Color enabling settings
git config --global	color.diff true
git config --global	color.status true
git config --global	color.branch true
git config --global	color.interactive true

# Core settings
git config --global	core.excludesfile ~/.gitexcludes
git config --global core.ignorecase false

### Default pull and push
# upstream - push the current branch to its upstream branch...
# simple - like upstream, but refuses to push if the upstream branch’s name is different from the local one...
# current - push the current branch to a branch of the same name.
###

git config --global	pull.default upstream
git config --global push.default upstream

T_EDITOR=${EDITOR:=vim}
git config --global	core.editor "$T_EDITOR"

# Print all settings
git --no-pager config --list
