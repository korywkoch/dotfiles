#!/bin/bash

# Environment pathing and editor defaults
PATH="$PATH:$HOME/.rvm/bin"
PATH="$PATH:$HOME/local/bin"
PATH="$PATH:$HOME/.bin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:/usr/local/mysql/bin"
PATH="$PATH:/usr/local/heroku/bin"
PATH="$PATH:$HOME/dev/utils/apache-maven-3.5.2/bin"

export PATH
export EDITOR="vim"
export ARCHFLAGS="-arch i386 -arch x86_64"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000

# Add some color to man pages
export LESS_TERMCAP_md="$(tput setaf 7)"

# http://ss64.com/bash/shopt.html
shopt -s histappend
shopt -s nocaseglob
shopt -s cdspell

# Bring in stuff that's elsewhere
if [ -f ~/.bash.prompt ]; then source ~/.bash.prompt; fi
if [ -f ~/.bash.aliases ]; then source ~/.bash.aliases; fi
if [ -f ~/.bash.completions ]; then source ~/.bash.completions; fi
if [ -f ~/.git-completion.bash ]; then source ~/.git-completion.bash; fi
if [ -f ~/.bashrc.local ]; then source ~/.bashrc.local; fi
if [ -f ~/.tnsrc ]; then source ~/.tnsrc; fi

# Use vi key-bindings in shell
set -o vi
set editing-mode vi


###-tns-completion-start-###
if [ -f /Users/kory.koch/.tnsrc ]; then
    source /Users/kory.koch/.tnsrc
fi
###-tns-completion-end-###

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
