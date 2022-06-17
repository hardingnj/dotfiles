# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# change on remote

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

########################################

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
#export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias rl='readlink -f'
alias qrshcwd='qrsh -wd `pwd` -pty y bash -i'
alias ll='ls -hl'
alias dushd='find . -maxdepth 1 -type d -exec du -sh {} \;'
alias la='ls -A'
alias l='ls -CF'
alias open='xdg-open'
alias cd..='cd ..'
alias lesss='less -S'
alias cdp='cd $(pwd -P)'
alias rsync='rsync --progress'
alias xclip='xclip -selection c'

# Ignore case for auto complete
bind 'set completion-ignore-case on'

# Functions
# turn epoch into data

export EDITOR=vim
export TERM=xterm
source /etc/profile

export PATH=/home/njh/src/bin:$PATH
export PATH=/usr/local/texlive/2015/bin/x86_64-linux/:$PATH
