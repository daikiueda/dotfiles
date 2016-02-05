#!/bin/sh
cd ~

brew install zsh --without-etcdir
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh

brew install homebrew/dupes/less
lesskey ~/workspace/dotfiles/less/lesskey

ln -s ~/workspace/dotfiles/.zshrc ~/.zshrc
ln -s ~/workspace/dotfiles/.vimrc ~/.vimrc
ln -s ~/workspace/dotfiles/.npmrc ~/.npmrc
ln -s /usr/local/Library/Contributions/brew_zsh_completion.zsh  /usr/local/share/zsh/site-functions/_brew

curl -sSL https://get.rvm.io | bash -s stable

brew install nodebrew
mkdir ~/.nodebrew
mkdir ~/.nodebrew/src
nodebrew install-binary stable
nodebrew use stable
