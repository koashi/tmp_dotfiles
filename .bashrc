# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /home/koashi/.git-prompt.sh
source /home/koashi/.git-completion.bash

# User specific aliases and functions
PS1='\[\033[36m\][\u@\H:\w$(__git_ps1 " (%s)")]\n\$\[\033[0m\] '

#alias
alias tmux='tmux -2'
