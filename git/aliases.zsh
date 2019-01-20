#!/bin/sh
#
#if command -v hub >/dev/null 2>&1; then
#	alias git='hub'
#fi

alias gpl='git pull --prune'
alias glga="glg --all"
alias gps='git push origin HEAD'
alias gpa='git push origin --all'
alias gca='git commit -a'
alias gb='git branch -v'
alias gaa='git add -A'
alias gpr='gp && git pr'
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'
gi() {
	curl -s "https://www.gitignore.io/api/$*"
}

