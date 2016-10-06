# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# change on remote

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
alias qq='qstat -r | grep "job-ID\|----\|nharding\|jobname" | sed 3~1"N;s/\n *Full jobname: */ /"|less'
alias la='ls -A'
alias tv='module load tmux vim'
alias quser='qstat -s r -u "*" | awk '"'"'{print $4}'"'"' | sort | uniq -c | sort -n'
alias qwait='qq| grep " qw"| wc -l'
alias l='ls -CF'
alias hn1='ssh hn1.hpc'
alias open='xdg-open'
alias cd..='cd ..'
alias lesss='less -S'
alias runtime='find . -name "*o.txt" -exec grep -Hni "total runtime" '"'"'{}'"'"' \;'
alias aggjn='qstat | grep " qw"| awk '"'"'{print $3}'"'"' | sort | uniq -c'
alias nl='nautilus .'
alias cdp='cd $(pwd -P)'
alias rsync='rsync --progress'

# Ignore case for auto complete
bind 'set completion-ignore-case on'

# Functions
# turn epoch into data
epoch () { perl -e "print scalar(localtime($*))"; echo; }
# display only selected option in manfile
manopt(){ man $1 |sed 's/.\x08//g'|sed -n "/^\s\+-\+$2\b/,/^\s*$/p"|sed '$d;';} 

export EDITOR=vim
export TERM=xterm
source /etc/profile

export BCV_HOME=/path/to/examples/bcvhome
export GOPATH=/home/njh/gocode

export PATH=/home/njh/src/bin:$PATH
export PATH=/usr/local/texlive/2015/bin/x86_64-linux/:$PATH

#export WORKON_HOME=~/pyenv
#source /usr/local/bin/virtualenvwrapper.sh

export WTC=well.ox.ac.uk
export FOX=foxtrot.$WTC
export ECH=echo.$WTC
export DEL=delta.$WTC

# added by Miniconda3 4.0.5 installer
xconda () { export PATH="/home/njh/miniconda3/bin:$PATH"; }

xpyenv () { export WORKON_HOME=~/pyenv; source /usr/local/bin/virtualenvwrapper.sh; }
