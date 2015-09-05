
#Install Vundle to handle vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Update plugins from .vimrc
vim +PluginInstall +qall

#Install ack (on debian systems) and rename to ack
sudo apt-get install ack-grep 
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep 