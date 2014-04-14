#Installation

##Install Xcode
###Mavericks
```console
sudo xcodebuild -license
xcode-select --install
```

##Clone Repo
`git clone git://github.com/clang1234/dotfiles ~/dotfiles`

##Run Setup Script
`bash ~/dotfiles/setup.ssh`

__Note__: Mac only right now

##Get Submodules
Switch to the `~/dotfiles` directory, and fetch submodules:

``` console
cd ~/dotfiles
git submodule init
git submodule update
```

###Saving for the future
Linux:
`ln -s ~/dotfiles/nix/bashrc ~/.bashrc`

If on Ubuntu:
`ln -s ~/dotfiles/nix/bash_profile ~/.profile`

Grab these packages:
`sudo apt-get install ctags python-pygments`
