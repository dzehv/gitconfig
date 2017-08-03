#!/bin/bash

echo -e "\e[32mApplying settings...\e[0m\n"
# Log alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
# Color enabling settings
git config --global	color.diff true
git config --global	color.status true
git config --global	color.branch true
git config --global	color.interactive true
# Core settings
git config --global	core.excludesfile ~/.gitexcludes

T_EDITOR=${EDITOR:=vim}
git config --global	core.editor "$T_EDITOR"

git config --list
