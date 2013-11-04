#!/bin/bash

echo "cloning https://github.com/aaronzirbes/vim-files.git to ~/.vim"
git clone https://github.com/aaronzirbes/vim-files.git ~/.vim
echo "cloning https://github.com/gmarik/vundle.git to ~/.vim/bundle/vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "symlinking ~/.vimrc ~/.ctags ~/.gvimrc"
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/ctags ~/.ctags
ln -s ~/.vim/gvimrc ~/.gvimrc
echo "calling BundleInstall using vundle plugin"
vim +BundleInstall +qall
echo "Done!"

