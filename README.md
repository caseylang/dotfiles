Installation:

git clone git://github.com/clang1234/dotfiles ~/dotfiles

Create symlinks:

ln -s ~/dotfiles/vim ~/.vim

ln -s ~/dotfiles/vim/vimrc ~/.vimrc

ln -s ~/dotfiles/shared/gitattributes ~/.gitattributes

ln -s ~/dotfiles/shared/gitconfig ~/.gitconfig

ln -s ~/dotfiles/shared/gitignore ~/.gitignore

ln -s ~/dotfiles/shared/inputrc ~/.inputrc

Mac:

ln -s ~/dotfiles/osx/bashrc ~/.bashrc

ln -s ~/dotfiles/osx/bash_profile ~/.bash_profile

Linux:

ln -s ~/dotfiles/nix/bashrc ~/.bashrc

If on Ubunut:

ln -s ~/dotfiles/nix/bash_profile ~/.profile

Switch to the `~/dotfiles` directory, and fetch submodules:

cd ~/dotfiles

git submodule init

git submodule update

Grab these packages:

sudo apt-get install ctags python-pygments

