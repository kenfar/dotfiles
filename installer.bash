#!/usr/bin/env bash
#
# .installer.bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Based on: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#

#----- Variables -----
dir=~/dotfiles
olddir=~/dotfiles_old
vimplugindir=~/.vim/ftplugin
files=".bashrc .profile .vimrc .inputrc .tmux.conf"
vimpluginfiles="python.vim"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

#---- set up .dotfiles in $HOME: ----
echo "Changing to the $dir directory"
cd $dir
echo "...done"
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/$file $olddir
        echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
done

#----  set up the vim plugins: ----
echo "Creating .vim ftplugin directory"
mkdir -p $vimplugindir
echo "Changing to the ~/.vim/ftplugin directory"
cd $vimplugindir
for file in $vimpluginfiles; do
	echo "Moving existing dotfiles from ~/.vim/ftplugin to $olddir"
	mv $vimplugindir/$file $olddir
        echo "Creating symlink to $file in vim's ftplugin directory."
        ln -s $dir/$file $vimplugindir/$file
done
