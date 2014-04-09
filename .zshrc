export LANG=ja_JP.UTF-8

export PATH=$HOME/.nodebrew/current/bin:$PATH


HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups


local p_mark="%B%(?,%F{green},%F{red})%(!.#.$)%f%b"
#local p_mark="%B%(!.#.$)%b"
PROMPT="[%c] $p_mark "
#setopt transient_rprompt


alias ls='ls -GF'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'


. <(npm completion)

