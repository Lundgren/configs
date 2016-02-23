#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Symlink files from git controlled config folder
ln -s "$DIR/.vimrc" ~/
ln -s "$DIR/.vim" ~/
ln -s "$DIR/.Xauthority" ~/
ln -s "$DIR/i3/" ~/.config/

#Install Vundle to handle vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Update plugins from .vimrc
vim +PluginInstall +qall

#Compile YouCompleteMe plugin.
(cd ~/.vim/bundle/YouCompleteMe; python install.py)

#Install ack (on debian systems) and rename to ack
#sudo apt-get install ack-grep 
#sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep 


#Backup/restore installed packages through pacman
#Backup:
#  pacman -Qqe | grep -v "$(pacman -Qmq)" > arch.pkglist
#Restore:
#  pacman -S $(cat arch.pkglist)
