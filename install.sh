#!/bin/bash

# git clone https://github.com/edkolev/tmuxline.vim ~/.vim/bundle/tmuxline.vim

# Install my .vimrc 
if [ -f ~/.vimrc ]; then
	echo "   - My .vimrc found"
else
	echo "   - Installing my .vimrc file"
	ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
fi

# Install my .bashrc 
if [ -f ~/.bashrc ]; then
	echo "   - My .bashrc found"
else
	echo "   - Installing my .bashrc file"
	ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
fi

# Adding some color
if [ -d ~/.vim/colors ]; then
	echo "   - Colors directory exists, backing up..."
	tar -czvf ~/colors-backup-DATE.tgz ~/.vim/colors
	rm -fr ~/.vim/colors
	cd ~/.vim
	#git clone git@github.com/josemrobles/colors.git
	git clone https://github.com/josemrobles/colors.git
else
	echo "   - No Colors present..."
	cd ~/.vim/
	git clone https://github.com/josemrobles/colors.git
fi
