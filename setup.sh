#!/bin/bash

# Atom.io
sudo add-apt-repository ppa:webupd8team/atom -y
# NodeJS
curl --location https://deb.nodesource.com/setup | sudo bash -

echo "Installing apt-get packages"
sudo apt-get update
sudo apt-get install -y vim atom nautilus-dropbox
sudo apt-get install -y git python-dev curl nodejs ctags
sudo apt-get install -y python-pip

echo "Installing Node stuff"
sudo npm install -g mocha gulp bower eslint

echo "Installing Python stuff"
sudo pip install django pywatch virtualenv

echo "Installing Atom.io packages"
apm install vim-mode vim-surround ex-mode advanced-new-file atom-beautify 
apm install atom-ctags atom-ternjs autocomplete-paths autocomplete-php 
apm install autocomplete-python autocomplete-sass color-picker emmet 
apm install file-icons language-babel language-blade language-docker linter
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
curl # # Atom.io
sudo add-apt-repository ppa:webupd8team/atom -y
# NodeJS
curl --location https://deb.nodesource.com/setup | sudo bash -

echo "Installing apt-get packages"
sudo apt-get update
sudo apt-get install -y google-chrome-unstable vim atom nautilus-dropbox
sudo apt-get install -y git python-dev virtualbox vagrant curl nodejs ctags
sudo apt-get install -y python-pip

echo "Installing Node stuff"
sudo npm install -g mocha gulp bower eslint

echo "Installing Python stuff"
sudo pip install django pywatch virtualenv

echo "Installing Atom.io packages"
apm install vim-mode vim-surround ex-mode advanced-new-file atom-beautify 
apm install atom-ctags atom-ternjs autocomplete-paths autocomplete-php 
apm install autocomplete-python autocomplete-sass color-picker emmet 
apm install file-icons language-babel language-blade language-docker linter
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
curl https://raw.githubusercontent.com/adlawson/vim-sorcerer/master/colors/sorcerer.vim > ~/.vim/colors/sorcerer.vim

echo "link dotfiles from git"
cd ~ 
shopt -s dotglob
if ![ -d ~/dotfiles]
    then 
        git clone https://github.com/colbydehart/dotfiles dotfiles
fi
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
