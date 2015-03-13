ZSH=~/.oh-my-zsh

ZSH_THEME="ys2"

alias weechat="weechat-curses"
alias synergy="synergys -f --config /home/bjarke/.quicksynergy/synergy.conf"
alias open="xdg-open"
alias ra="ranger"
alias tree="tree -C -L 3"
alias emacsbg='emacs&;disown;'
alias edit='emacsclient --alternate-editor="" "$@"'
alias pgshell='psql -p5432 -U postgres'
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

COMPLETION_WAITING_DOTS="true"

plugins=(git github cabal fasd common-aliases gitignore sbt scala postgresql vi-mode)

export KEYTIMEOUT=1
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

source $ZSH/oh-my-zsh.sh

function git_restore { git checkout $(git rev-list -n 1 HEAD -- "$1")^ -- "$1"; }
export git_restore

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$HOME/Applications/02263/sal/bin/:$HOME/Applications/02263/pvs/:$HOME/Workspace/config/shell:$HOME/.cabal/bin:$PATH

eval "$(fasd --init auto)"
