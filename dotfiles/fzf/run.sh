#!/usr/bin/env zsh
print -rl -- ${(ko)commands} | tail -n +2 | fzf | (nohup ${SHELL:-"/bin/sh"} &) >/dev/null 2>&1