set -g theme_display_date no

set -x LANG ja_JP.UTF-8

set -x PATH /usr/local/share/git-core/contrib/diff-highlight $PATH
set -x LESSKEY $HOME/.less

set -x NODE_PATH $HOME/.nodebrew/current/bin
set -x PATH $NODE_PATH $PATH

set -x PATH $HOME/workspace/bin $HOME/workspace/dotfiles/bin $PATH

alias ls "ls -GF"
