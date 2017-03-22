#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc gvimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

# install vim-plug if not here

if [ ! -f ~/.vim/autoload/plug.vim ]
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# VIM COLORS
rm ~/.vim/colors/Monokai.vim
ln -s ~/dotfiles/.vim/colors/Monokai.vim ~/.vim/colors/Monokai.vim

# NVIM
mkdir ~/.config/nvim/colors
ln -s ~/dotfiles/.vim/colors/Monokai.vim ~/.config/nvim/colors/Monokai.vim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim


# BASH PROFILE
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
