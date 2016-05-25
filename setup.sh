#!/bin/sh
cd ~

brew install zsh --without-etcdir
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh

brew install homebrew/dupes/less
lesskey ~/workspace/dotfiles/less/lesskey

ln -s ~/workspace/dotfiles/.zshrc ~/.zshrc
ln -s ~/workspace/dotfiles/.vimrc ~/.vimrc
ln -s ~/workspace/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/workspace/dotfiles/.npmrc ~/.npmrc
ln -s ~/workspace/dotfiles/.eslintrc ~/.eslintrc
ln -s /usr/local/Library/Contributions/brew_zsh_completion.zsh  /usr/local/share/zsh/site-functions/_brew

git config --global core.excludesfile ~/.gitignore_global

brew install pyenv
pyenv install anaconda2-4.0.0
pyenv global anaconda2-4.0.0
#pyenv local anaconda2-4.0.0
#pip install Pygments

curl -sSL https://get.rvm.io | bash -s stable

brew install argon/mas/mas
mas install 406056744 # Evernote
mas install 449589707 # Dash
mas install 803453959 # Slack

brew install nodebrew
nodebrew setup
#mkdir ~/.nodebrew
#mkdir ~/.nodebrew/src
nodebrew install-binary stable
nodebrew use stable
