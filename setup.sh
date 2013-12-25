#!/bin/sh

# setup.sh

# Script path
CURRENT=$(cd $(dirname $0) && pwd)

# Symbolic link
ln -s ${CURRENT}/.bash_profile ~
ln -s ${CURRENT}/.bashrc ~
ln -s ${CURRENT}/.vimrc ~
ln -s ${CURRENT}/.tmux.conf ~
