Installation:

git clone git://github.com/clang1234/dotfiles ~/dotfiles

Create symlinks:

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc

Mac:
ln -s ~/dotfiles/osx/bashrc ~/.bashrc
ln -s ~/dotfiles/osx/bash_profile ~/.bash_profile

Linux:
ln -s ~/dotfiles/nix/bashrc ~/.bashrc

Switch to the `~/dotfiles` directory, and fetch submodules:

cd ~/dotfiles
git submodule init
git submodule update
