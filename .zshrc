autoload -U compinit
compinit


export LANG=ja_JP.UTF-8

export NODE_PATH=$HOME/.nodebrew/current/bin

export PATH=/usr/local/bin:$PATH
export PATH=$NODE_PATH:$PATH
export PATH=$HOME/.rvm/bin:$PATH


HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups


local p_mark="%B%(?,%F{green},%F{red})%(!.#.$)%f%b"
PROMPT="[%c] $p_mark "
#setopt transient_rprompt


setopt noclobber
setopt autocd

alias ls='ls -GF'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

alias rm='rm -i'

alias saykana='saykana -s 50'


. <(npm completion)
. <(grunt --completion=zsh)

