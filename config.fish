set -f WORK_SPACE "Workspace"

set -g theme_display_date no

set -x LANG ja_JP.UTF-8

fish_add_path $HOME/$WORK_SPACE/dotfiles/bin

alias rm trash

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)

    fish_add_path /opt/homebrew/share/git-core/contrib/diff-highlight/

    set -x LESS "-R"
    set src_hilite_lesspipe (find /opt/homebrew/Cellar/source-highlight/ -name "src-hilite-lesspipe.sh")
    set -x LESSOPEN "| $src_hilite_lesspipe %s"

    alias node "env NODE_NO_READLINE=1 rlwrap --always-readline node"
    alias babel-node "env NODE_NO_READLINE=1 rlwrap --always-readline babel-node"
end
