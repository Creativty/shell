#!/bin/bash

# Clipboard
alias xclip="xclip -selection clipboard"
alias xpaste="xclip -out"

# Notes
export NOTES_DIRECTORY=$(realpath $HOME/notes)
alias notes=$(realpath $HOME/goinfre/notes)

# Remind


# Common
alias cd..="cd .."
alias ls="ls --color=always"

# Programs
alias ctags="ctags --recurse=yes --exclude=.git --exclude=\*.swp --exclude=\*.pdb"
alias python="python3"
alias remind=$(realpath $HOME/.local/bin/remind)
