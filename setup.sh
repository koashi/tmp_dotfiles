#!/bin/sh

# setup.sh

# Script path
CURRENT=$(cd $(dirname $0) && pwd)

# Symbolic link
ln -s ${CURRENT}/.bash_profile ~
ln -s ${CURRENT}/.bashrc ~
ln -s ${CURRENT}/.vimrc ~
ln -s ${CURRENT}/.gvimrc ~
ln -s ${CURRENT}/.tmux.conf ~

# Download git-completion and git-prompt
if [ -x $(which curl) ]; then
    curl -o ~/.git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
    curl -o ~/.git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
else
    echo 'curl not found'
fi

if [ -x $(which git) ]; then
    # Install NeoBundle.vim
    if [ ! -d ~/.vim/bundle ]; then
        mkdir -p ~/.vim/bundle
        git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    fi

    # git
    if [ ! -f ~/.gitconfig ]; then
        git config --global core.editor vim
        git config --global alias.st status
        git config --global alias.ci commit
        git config --global alias.co checkout
        git config --global alias.br branch
        git config --global color.status auto
        git config --global color.diff auto
        git config --global color.branch auto
    fi
else
    echo 'git not found'
fi
