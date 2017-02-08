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
ln -s ~/workspace/dotfiles/.eslintrc.yml ~/.eslintrc.yml
ln -s ~/workspace/dotfiles/.tldrrc ~/.tldrrc
ln -s /usr/local/Library/Contributions/brew_zsh_completion.zsh  /usr/local/share/zsh/site-functions/_brew

git config --global core.excludesfile ~/.gitignore_global
git config --global alias.st "status -sb"
git config --global alias.unstage "reset -q HEAD --"
git config --global alias.discard "checkout --"
git config --global alias.uncommit "reset --mixed HEAD~"
git config --global alias.amend "commit --amend"
git config --global alias.nevermind "!git reset --hard HEAD && git clean -d -f"
git config --global alias.graph "log --graph -10 --branches --remotes --tags  --format=format:'%Cgreen%h %Creset• %<(75,trunc)%s (%cN, %cr) %Cred%d' --date-order"
git config --global alias.precommit "diff --cached --diff-algorithm=minimal -w"
git config --global alias.remote "remote -v"
git config --global pager.log 'diff-highlight | less'
git config --global pager.show 'diff-highlight | less'
git config --global pager.diff 'diff-highlight | less'
git config --global commit.verbose true
git config --global diff.compactionHeuristic true

brew install pyenv
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v 2.7.12
pyenv global 2.7.12
pip install Pygments

curl -sSL https://get.rvm.io | bash -s stable

brew install argon/mas/mas
mas install 406056744 # Evernote
mas install 449589707 # Dash
mas install 803453959 # Slack

brew install nodebrew
nodebrew setup
nodebrew install-binary stable
nodebrew use stable
