#!/bin/bash

function ask() {
	read -p "$1 (Y/n):" resp
	if [ -z "$resp" ]; then
		response_lc="y"
	else
		response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
	fi

	[ "$response_lc" = "y" ]
}

SH=$(realpath "$HOME/.bashrc")

echo "-------- Importing scripts --------"

# Ask which files should be sourced
for file in sources/*; do
	if [ -f "$file" ]; then
		filename=$(basename "$file")
		if ask "${filename}?"; then
			echo "source $(realpath "$file")" >> "$SH"
		fi
	fi
done

# Tmux configuration
echo "-------- Import   dotfiles --------"
if ask "Do you want to install .tmux.conf?"; then
	ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf
fi

# Vim configuration
if ask "Do you want to install .vimrc?"; then
	ln -s "$(realpath ".vimrc")" ~/.vimrc
fi

# Case insensitive auto completion
if ask "Do you want to install .inputrc?"; then
	ln -s "$(realpath ".inputrc")" ~/.inputrc
fi
