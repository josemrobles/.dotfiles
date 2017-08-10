#!/bin/bash

# git clone https://github.com/edkolev/tmuxline.vim ~/.vim/bundle/tmuxline.vim

# Install my .vimrc 
echo "- Checking for my .vimrc file"
grep -q "ROBI" ~/.vimrc
if [ $? -eq 1 ] ; then
	echo "   - Installing my .vimrc file"
	pwd=$(pwd)
	mv ~/.vimrc ~/.vimrc.BAK
	ln -s $pwd/vim/vimrc ~/.vimrc
else
	echo "   - My .vimrc found"
fi

# Install Jellybeans color scheme
echo "- Checking for vim colors dir:"
if [ -d ~/.vim/colors ]; then
	echo "   - Directory exists, checking for jellybeans.vim"
	if [ -f ~/.vim/colors/jellybeans.vim ]; then
		echo "   - File exists"
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
