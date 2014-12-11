fpath=(/usr/local/share/zsh/site-functions $fpath)

autoload -U compinit
compinit


export LANG=ja_JP.UTF-8

export NODE_PATH=$HOME/.nodebrew/current/bin

export PATH=/usr/local/bin:$PATH
export PATH=$NODE_PATH:$PATH
export PATH=$HOME/.rvm/bin:$PATH

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.7"`
export PATH=$JAVA_HOME/bin:$PATH

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


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

alias monbod='mongod --config /usr/local/etc/mongod.conf'

alias saykana='saykana -s 50'


. <(npm completion)
. <(grunt --completion=zsh)

