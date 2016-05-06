#!/bin/bash

# Environment pathing and editor defaults
PATH="$HOME/local/bin:$PATH"
PATH="$HOME/.bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/mysql/bin:$PATH"
PATH="/usr/local/heroku/bin:$PATH"

export PATH
export EDITOR="vim"
export ARCHFLAGS="-arch i386 -arch x86_64"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000

# Add some color to man pages
export LESS_TERMCAP_md="$(tput setaf 4)"

# unset MAILCHECK

# http://ss64.com/bash/shopt.html
shopt -s histappend
shopt -s nocaseglob
shopt -s cdspell

# Bring in stuff that's elsewhere
if [ -f ~/.bash_prompt ]; then source ~/.bash_prompt; fi
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases; fi
if [ -f ~/.bash_completions ]; then source ~/.bash_completions; fi
if [ -f ~/.bashrc.local ]; then source ~/.bashrc.local; fi

# Only print if we're in an interactive shell.
# Non-interactive stuff like rsync will blow up otherwise
#if [[ "$-" == *"i"* ]]; then
#  echo -e "\033[0;35m------------------------------------------\033[0m"
#fi

