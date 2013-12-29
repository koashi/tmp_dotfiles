# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f $HOME/.git-prompt.sh ]; then
        . $HOME/.git-prompt.sh
        PS1='\[\033[36m\][\u@\H:\w$(__git_ps1 " (%s)")]\n\$\[\033[0m\] '
else
        PS1='\[\033[36m\][\u@\H:\w]\n\$\[\033[0m\] '
fi

if [ -f $HOME/.git-completion.bash ]; then
        . $HOME/.git-completion.bash
fi

# Mac
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# User specific aliases and functions

# Alias
alias tmux='tmux -2'
alias ll='ls -l'
alias la='ls -la'

# History
HISTFILE=~/.bash_history
HISTTIMEFORMAT="%y/%m/%d %H:%M:%S: "
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
HISTSIZE=300000

# Set hostname 
printf "\033k$HOSTNAME\033\\"
