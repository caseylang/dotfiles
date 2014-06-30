#!/usr/bin/env bash
### end common-components/bash-shebang

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e
### end common-components/exit-trap

if [[ ! -d "$HOME/.bin/" ]]; then
  mkdir "$HOME/.bin"
fi

### end common-components/check-home-bin

fancy_echo() {
  printf "\n%b\n" "$1"
}
### end common-components/shared-functions

#TODO: Check if files exist first, skip
fancy_echo "Setting up dotfiles..."

fancy_echo "Vim"
  ln -s ~/dotfiles/vim ~/.vim
  ln -s ~/dotfiles/vim/vimrc ~/.vimrc

fancy_echo "Git"
  ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
  ln -s ~/dotfiles/git/gitignore ~/.gitignore
  ln -s ~/dotfiles/shared/inputrc ~/.inputrc

fancy_echo "Bash"
  ln -s ~/dotfiles/bash/osx/bashrc ~/.bashrc
  ln -s ~/dotfiles/bash/osx/bash_profile ~/.bash_profile
### end dotfiles

if ! command -v brew &>/dev/null; then
  fancy_echo "Installing Homebrew, a good OS X package manager ..."
    ruby <(curl -fsS https://raw.github.com/Homebrew/homebrew/go/install)

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    fancy_echo "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update
### end mac-components/homebrew

fancy_echo "Installing Postgres, a good open source relational database ..."
  brew install postgres --no-python

fancy_echo "Installing The Silver Searcher (better than ack or grep) to search the contents of files ..."
  brew install the_silver_searcher

fancy_echo "Installing vim from Homebrew to get the latest version ..."
  brew install vim

fancy_echo "Installing wget"
  brew install wget

fancy_echo "Installing tree"
  brew install tree
### end mac-components/packages

#TODO: Check if service is running and skip
fancy_echo "Starting Postgres ..."
  brew services start postgres
### end mac-components/start-services

fancy_echo "Installing rbenv, to change Ruby versions ..."
  brew install rbenv

  if ! grep -qs "rbenv init" ~/.bashrc; then
    printf 'export PATH="$HOME/.rbenv/bin:$PATH"\n' >> ~/.bashrc
    printf 'eval "$(rbenv init - --no-rehash)"\n' >> ~/.bashrc

    fancy_echo "Enable shims and autocompletion ..."
      eval "$(rbenv init -)"
  fi

  export PATH="$HOME/.rbenv/bin:$PATH"

fancy_echo "Installing rbenv-gem-rehash so the shell automatically picks up binaries after installing gems with binaries..."
  brew install rbenv-gem-rehash

fancy_echo "Installing ruby-build, to install Rubies ..."
  brew install ruby-build
### end mac-components/rbenv

fancy_echo "Upgrading and linking OpenSSL ..."
  brew install openssl
  brew link openssl --force
  brew install curl-ca-bundle
### end mac-components/compiler-and-libraries

ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"

fancy_echo "Installing Ruby $ruby_version ..."
  # TODO: there seems to be a build error with all Ruby 2+
  rbenv install "$ruby_version"

fancy_echo "Setting $ruby_version as global default Ruby ..."
  rbenv global "$ruby_version"
  rbenv rehash

fancy_echo "Updating to latest Rubygems version ..."
  gem update --system

fancy_echo "Installing Bundler to install project-specific Ruby gems ..."
  gem install bundler --no-document --pre
### end common-components/ruby-environment

fancy_echo "Configuring Bundler for faster, parallel gem installation ..."
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))
### end mac-components/bundler

fancy_echo "Installing Heroku CLI client ..."
  brew install heroku-toolbelt
### end mac-components/heroku

fancy_echo "Installing GitHub CLI client ..."
  brew install hub
### end mac-components/github

fancy_echo "Installing Cask for drag and drop application installs"
  brew tap phinze/homebrew-cask
  brew install brew-cask

fancy_echo "Installing Vagrant"
  brew cask install vagrant

fancy_echo "Installing VMWare Fusion"
  brew cask install vmware-fusion

fancy_echo "Installing Alfred"
  brew cask install alfred

fancy_echo "Installing Chrome"
  brew cask install google-chrome
