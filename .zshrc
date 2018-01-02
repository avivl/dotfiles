# zplug
export ZPLUG_HOME=$HOME/.zplug
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$ZPLUG_HOME/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/bin
export PATH=$PATH:~/bin:~/google-cloud-sdk/bin
export TERM=screen-256color-bce
export ANDROID_HOME=$HOME/android-sdks
export ANDROID_SDK_ROOT=$HOME/android-sdks
export NDK_ROOT=$ANDROID_HOME/android-ndk-r9
[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm"
zstyle ":zplug:tag" depth 0
source $ZPLUG_HOME/init.zsh
zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, defer:2, hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto"
zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:load' pmodule \
    'environment' \
    'history' \
    'terminal' \
    'utility' \
    'tmux' \
    'completion' \
    ;
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:tmux:iterm' integrate 'yes'
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "Tarrasch/zsh-bd", use:bd.zsh
#zplug "chriskempson/base16-shell", use:"scripts/base16-eighties.sh"
zplug "dennishafemann/tmux-cssh", use:"tmux-cssh", as:command
zplug "djui/alias-tips"
zplug "junegunn/fzf", use:"bin/fzf-tmux", as:command
zplug "junegunn/fzf-bin", from:gh-r, use:"*darwin*", rename-to:"fzf", as:command
zplug "michaeldfallen/git-radar", use:git-radar, as:command
zplug "paulirish/git-open", as:command
zplug "scmbreeze/scm_breeze", hook-build:"$ZPLUG_HOME/repos/scmbreeze/scm_breeze/install.sh"
zplug "supercrabtree/k"
zplug "tj/git-extras", use:"bin/*", as:command, hook-build:"make install PREFIX=$HOME/.git-extras"
zplug "zsh-users/zsh-autosuggestions"
zplug "b4b4r07/enhancd", use:init.sh, defer:3  # after prezto
zplug "zsh-users/zsh-syntax-highlighting", defer:3  # >=10 means after compinit
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "plugins/brew", from:oh-my-zsh
zplug "tj/git-extras", use:"bin/*", as:command, hook-build:"make install PREFIX=$HOME/.git-extras"
zplug "caarlos0/zsh-git-sync"
zplug "caarlos0/git-add-remote"

zplug load

# options
stty start undef  # disable C-s stopping receiving keyboard signals.
stty stop undef
setopt COMPLETE_ALIASES  # don\'t expand aliases _before_ completion has finished, like: git comm-[tab]
unsetopt CORRECT  # no autocorrection suggestions
setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution

# vi mode
bindkey -v
# export KEYTIMEOUT=1  # 100 ms vim mode change key timeout
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^p' up-history  # Use vim cli mode
bindkey '^n' down-history
bindkey '^?' backward-delete-char  # backspace and ^h working even after returning from command mode
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word  # ctrl-w removed word backwards
bindkey '^r' history-incremental-search-backward  # ctrl-r starts searching history backward

# theme
get_pwd() {
    git_root=$PWD
    while [[ $git_root != / && ! -e $git_root/.git ]]; do git_root=$git_root:h; done
    if [[ $git_root = $HOME || $git_root = / ]]; then unset git_root; prompt_short_dir=%~;
    else parent=${git_root%\/*}; prompt_short_dir=${PWD#$parent/}; fi
    echo $prompt_short_dir
}

prompt_virtualenv() { [[ -n $VIRTUAL_ENV && -n $VIRTUAL_ENV_DISABLE_PROMPT ]] && echo "%{$fg_bold[white]%}($(basename $VIRTUAL_ENV)) "; }
autoload -Uz get_pwd
autoload -Uz prompt_virtualenv
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit
PROMPT="%{$fg_bold[magenta]%}\$(get_pwd)%{$reset_color%} \$(git-radar --zsh --fetch)\$(prompt_virtualenv)%{$fg_bold[magenta]%}λ%{$reset_color%} "

# syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root line)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

# history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# enhancd
if zplug check b4b4r07/enhancd; then
    export ENHANCD_FILTER=fzf-tmux
    export ENHANCD_DISABLE_DOT=1
    export ENHANCD_DISABLE_HYPHEN=1
fi

#git-radar
export GIT_RADAR_FORMAT="[%{$reset_color%}%{remote: }%{branch}%{ :local}%{$reset_color%}%{ :changes}%{ :stash}] "
export GIT_RADAR_MASTER_SYMBOL="m"
export PATH=$HOME/.git-extras:$PATH

# python
export PATH=$HOME/.local/bin:$PATH
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VIRTUALENVWRAPPER_PYTHON=$(which python2)
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh
source $VIRTUALENVWRAPPER_SCRIPT

# golang
#export GOPATH=$HOME/.go
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias myconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
myconfig config --local status.showUntrackedFiles no

HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# docker
alias docker='jq -s "reduce .[] as \$x ({}; . * \$x)" $HOME/.docker/config.d/*.json > ~/.docker/config.json && docker'
alias dr="docker run --rm -it"
alias di="docker images | head -n 1 && docker images | tail -n +2 | sort"
alias dps="docker ps -a"
alias drm="docker rm"
alias drmi="docker rmi"
alias drmd="dps | grep -e Exited -e Created | awk '{print \$3}' | xargs docker rm"
alias drmid="docker images -qf dangling=true | tr '\n' ' ' | xargs docker rmi -f && \
    docker images | grep \"^<none>\" | awk \"{print $3}\" | tr '\n' ' ' | tr '\n' ' ' | xargs docker rmi -f"
alias dc="docker-compose"

alias tailf="tail -f"

alias c="cd"
alias c-="c -"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aviv.laufer/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/aviv.laufer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aviv.laufer/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/aviv.laufer/google-cloud-sdk/completion.zsh.inc'; fi

[[ -s "$HOME/.gvm/scripts/gvm"  ]] && source "$HOME/.gvm/scripts/gvm"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ISTIO=$GOPATH/src/istio.io
eval "$(pipenv --completion)"
[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
