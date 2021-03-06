set -g theme_display_date no

set -x LANG ja_JP.UTF-8

set -x PATH /usr/local/share/git-core/contrib/diff-highlight $PATH
set -x LESSKEY $HOME/.less

# Node.js
set -x PATH $HOME/.nodebrew/current/bin $PATH
gulp --completion=fish | source

# Python
status --is-interactive; and source (pyenv init -|psub)

# Ruby
rbenv init - | source

set -x PATH $HOME/workspace/dotfiles/bin $PATH

set -x PATH_FOR_BREW (string join ':' (string replace $HOME/.pyenv/shims '' $PATH))
alias brew "env PATH=$PATH_FOR_BREW brew"

alias node "env NODE_NO_READLINE=1 rlwrap --always-readline node"
alias babel-node "env NODE_NO_READLINE=1 rlwrap --always-readline babel-node"

alias rm trash
