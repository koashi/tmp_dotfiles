# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f $HOME/.git-prompt.sh ]; then
        source $HOME/.git-prompt.sh
        PS1='\[\033[36m\][\u@\H:\w$(__git_ps1 " (%s)")]\n\$\[\033[0m\] '
else
        PS1='\[\033[36m\][\u@\H:\w$)]\n\$\[\033[0m\] '
fi

if [ -f $HOME/.git-completion.bash ]; then
        source $HOME/.git-completion.bash
fi

# User specific aliases and functions

#alias
alias tmux='tmux -2'
alias la='ls -la'

#history
export HISTTIMEFORMAT="%y/%m/%d %H:%M:%S: "
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=300000
