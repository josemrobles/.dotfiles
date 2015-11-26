# Symlink configs
  # Backup vimrc
  # Backup bashrc
  # Backup tmux 

  # Symlinks

# Install Jellybeans color scheme
if [ -d "~/.vim/colors" ]; then
	echo ".vim/colors exists, checking for jellybeans.vim"
	if [ -f "~/.vim/colors/jellybeans.vim" ]; then
		echo "File exists"
	else
		echo "File does not exist"
	fi
	#cd ~/.vim/colors
else
	echo ".vim/colors does not exist, creating it & installing jellybeans.vim"
fi
