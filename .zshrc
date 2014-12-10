# TMUX
#if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    #test -z "$TMUX" && (tmux -u attach || tmux -u new-session)
#fi

#source /usr/share/doc/pkgfile/command-not-found.zsh

# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="frisk"
#ZSH_THEME="frisk-custom"
#ZSH_THEME="agnoster"
ZSH_THEME="avit"

#aliases
alias weechat="weechat-curses"
alias synergy="synergys -f --config /home/bjarke/.quicksynergy/synergy.conf"
alias open="xdg-open"
alias ra="ranger"

ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)


plugins=(git scala github sbt cabal common-aliases) #vi-mode)

export KEYTIMEOUT=1

#bindkey -v 
#
#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=/home/bjarke/Workspace/shell:$HOME/.cabal/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/usr/sbin:/sbin:/home/bjarke/Workspace/shell:/home/bjarke/Workspace/shell/startup-scripts:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH

# Git restore file
function git_restore { git checkout $(git rev-list -n 1 HEAD -- "$1")^ -- "$1"; }
export git_restore

export EDITOR=vim
export TERM=xterm-256color

alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS
