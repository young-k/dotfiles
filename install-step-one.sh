#!/bin/bash
# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

# common brew packages
brew install autojump
brew install direnv
brew install git
brew install nvm
brew install python3
brew install tmux
brew install wget
brew install zsh zsh-completions

# set zsh as default shell
chsh -s /bin/zsh
zsh
