#!/bin/sh
test -d $ZPLUG_REPOS/junegunn/fzf/shell || return 0

export FZF_COMPLETION_TRIGGER='**'

# shellcheck disable=SC1091
. $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh
