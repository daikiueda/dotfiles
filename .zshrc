fpath=(/usr/local/share/zsh/site-functions $fpath)

autoload -U compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
compinit
setopt complete_aliases


export LANG=ja_JP.UTF-8

export PATH=/usr/local/bin:$PATH

export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH:

export NODE_PATH=$HOME/.nodebrew/current/bin
export PATH=$NODE_PATH:$PATH

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
export PATH=$JAVA_HOME/bin:$PATH

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# export PATH=$HOME/workspace/bin:$HOME/workspace/dotfiles/bin:$PATH
export PATH=$HOME/workspace/dotfiles/bin:$PATH

export LESSKEY=$HOME/.less

export HOMEBREW_CASK_OPTS="--appdir=/Applications"


HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" formats "\U1F516 %F{cyan}%b%f"
function echo_vcs_info(){
	vcs_info
	echo $vcs_info_msg_0_
}
add-zsh-hook precmd vcs_info

setopt prompt_subst
#setopt transient_rprompt
local p_mark='%B%(?,%F{green},%F{red})%(!.#.$)%f%b'
PROMPT='[%c$(echo_vcs_info)] $p_mark '


setopt noclobber
setopt autocd
setopt auto_pushd
setopt correct


alias ls="ls -GF"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -al"

alias rm="trash"

alias node="NODE_NO_READLINE=1 rlwrap --always-readline node"
alias babel-node="NODE_NO_READLINE=1 rlwrap --always-readline babel-node"

alias brew="env PATH=${PATH//$PYENV_ROOT\/shims/} brew"

alias tl="tldr"

. <(npm completion)
#. <(grunt --completion=zsh)
. <(gulp --completion=zsh)


echo -e "\n\U1F408  \U1F408  \U1F408  \U1F408\n"
