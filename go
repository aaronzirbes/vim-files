#!/bin/bash

if [ ! -d ~/.vim/ ]; then
    echo "cloning https://github.com/aaronzirbes/vim-files.git to ~/.vim"
    git clone https://github.com/aaronzirbes/vim-files.git ~/.vim
else
    echo "~/.vim/ already exists. skipping."
fi

if [ ! -d ~/.vim/bundle/vundle ]; then
    echo "cloning https://github.com/gmarik/vundle.git to ~/.vim/bundle/vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
    echo "~/.vim/bundle/vundle already exists. skipping."
fi

if [ ! -e ~/.vimrc ] && [ ! -e ~/.ctags ] && [ ! -e ~/.gvimrc ]; then
    echo "symlinking ~/.vimrc ~/.ctags ~/.gvimrc"
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/ctags ~/.ctags
    ln -s ~/.vim/gvimrc ~/.gvimrc
else
    echo "one or more of ~/.vimrc ~/.ctags ~/.gvimrc exists, not creating symlinks:"
    echo "    ln -s ~/.vim/vimrc ~/.vimrc"
    echo "    ln -s ~/.vim/ctags ~/.ctags"
    echo "    ln -s ~/.vim/gvimrc ~/.gvimrc"
fi
echo "Disabling Tomorrow-Night theme until the bundle is installed"
sed -i -e 's/colorscheme Tomorrow-Night/"colorscheme Tomorrow-Night/' ~/.vimrc

echo "calling BundleInstall using vundle plugin"
vim +BundleInstall +qall

echo "Re-Enabling Tomorrow-Night theme until the bundle is installed"
sed -i -e 's/"colorscheme Tomorrow-Night/colorscheme Tomorrow-Night/' ~/.vimrc

echo "Done!"

