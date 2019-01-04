#!/usr/bin/env bash

for dir in /Users/aviv.laufer/Git/avivl/forks-doit/*
do
cd $dir 
echo syncing $dir
$ZPLUG_HOME/repos/caarlos0/zsh-git-sync/git-sync 
cd .. 
done
