#!/bin/bash
clear
# Symlink configs
  # Backup vimrc
  # Backup bashrc
  # Backup tmux 

  # Symlinks

# Install Jellybeans color scheme
echo "Checking for vim colors  dir:"
if [ -d ~/.vim/colors ]; then
	echo "--- Directory exists, checking for jellybeans.vim"
	if [ -f ~/.vim/colors/jellybeans.vim ]; then
		echo "--- File exists"
	else
		echo "File does not exist, downloading"
		cd ~/.vim/colors;
		git clone git@github.com:nanotech/jellybeans.vim.git
	fi
else
	echo " ~/.vim/colors does not exist, creating it & installing jellybeans.vim"
	mkdir -p ~/.vim/colors;
	cd ~/.vim/colors;
	git clone git@github.com:nanotech/jellybeans.vim.git
fi
