#!/bin/bash

echo "Installing NodeJS"
curl --location https://deb.nodesource.com/setup | sudo bash -

echo "Installing apt-get packages"
sudo apt-get update
sudo apt-get install -y git python-dev curl nodejs ctags
sudo apt-get install -y python-pip

echo "Installing Node stuff"
sudo npm install -g mocha gulp bower eslint

echo "Installing Python stuff"
sudo pip install django pywatch virtualenv flake8

echo "Installing Atom.io packages"
apm install vim-mode vim-surround ex-mode atom-beautify
apm install atom-ctags atom-ternjs autocomplete-paths autocomplete-php
apm install autocomplete-python color-picker emmet
apm install file-icons language-babel language-blade linter
apm install linter-eslint linter-flake8 linter-php merge-conflicts todo-show
apm install php-debug pigments regex-railroad-diagram

echo "Configuring git"
git config --global user.name "Colby DeHart"
git config --global user.email colbydehart@gmail.com
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore_global

echo "Setting up vim"
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh -
mkdir -p .vim/colors
curl http://www.vim.org/scripts/download_script.php?src_id=13400 > ~/.vim/colors/wombat.vim

sudo pip install django pywatch virtualenv

echo "link dotfiles from git"
cd ~
shopt -s dotglob
rm ~/.bash_aliases
rm ~/.eslintrc
rm ~/.gitignore_global
rm ~/.inputrc
rm ~/.vimrc
rm ~/.tmux.conf

rm ~/.atom/keymap.cson
rm ~/.atom/config.cson

ln -s ~/dotfiles/.bash_aliases
ln -s ~/dotfiles/.eslintrc
ln -s ~/dotfiles/.gitignore_global
ln -s ~/dotfiles/.inputrc
ln -s ~/dotfiles/.vimrc
ln -s ~/dotfiles/.tmux.conf

ln -s ~/dotfiles/keymap.cson .atom/keymap.cson
ln -s ~/dotfiles/config.cson .atom/config.cson
