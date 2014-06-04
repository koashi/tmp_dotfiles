# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source git-prompt
if [ -f ~/.git-prompt.sh ]; then
        . ~/.git-prompt.sh
        PS1='\[\033[36m\][\u@\H:\w$(__git_ps1 " (%s)")]\[\033[0m\]\n\[\033[36m\]\$\[\033[0m\] '
        PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
else
        PS1='\[\033[36m\][\u@\H:\w]\[\033[0m\]\n\[\033[36m\]\$\[\033[0m\] '
fi

# Source git-completion
if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
fi

# For Mac
if [ $(uname) = "Darwin" ]; then
	# Source bash_completion
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi

# User specific aliases and functions

# Alias
alias tmux='tmux -2'
if [ $(uname) = "Darwin" ]; then
        alias ls='ls -G'
        alias ll='ls -lG'
        alias la='ls -laG'
else
        alias ll='ls -l'
        alias la='ls -la'
fi

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
