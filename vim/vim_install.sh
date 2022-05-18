#!/bin/bash

mkdir -p ~/.vim/colors
mkdir -p ~/.config/nvim/colors

cp ./vim.vim ~/.vimrc
cp ./nvim.vim ~/.config/nvim/init.vim

curl -o ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
cp ~/.vim/colors/molokai.vim ~/.config/nvim/colors/molokai.vim

nvim -c "PlugInstall"

echo "Done!"



