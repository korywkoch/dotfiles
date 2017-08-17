if [ -r ~/.bashrc ]; then source ~/.bashrc; fi
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


###-tns-completion-start-###
if [ -f /Users/kory.koch/.tnsrc ]; then 
    source /Users/kory.koch/.tnsrc 
fi
###-tns-completion-end-###
