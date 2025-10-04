# #!/bin/sh
cd ~

brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install bobthefish

fisher install jorgebucaran/nvm.fish
nvm install latest
npm i -g tldr 
set -U nvm_default_version latest
set -U nvm_default_packages tldr @anthropic-ai/claude-code

brew install trash

ln -s ~/Workspace/dotfiles/_config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/Workspace/dotfiles/_config/ghostty/config ~/.config/ghostty/config
ln -s ~/Workspace/dotfiles/_config/git/ignore ~/.config/git/ignore
ln -s ~/Workspace/dotfiles/.vimrc ~/.vimrc
ln -s ~/Workspace/dotfiles/.npmrc ~/.npmrc
ln -s ~/Workspace/dotfiles/.tldrrc ~/.tldrrc

ln -s ~/Workspace/dotfiles/_claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/Workspace/dotfiles/_codex/AGENTS.md ~/.codex/AGENTS.md

git config --global core.excludesfile ~/.config/git/ignore
git config --global alias.co "checkout"
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
