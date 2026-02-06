set -f WORK_SPACE "Workspace"

set -g theme_display_date no

set -x LANG ja_JP.UTF-8

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.pyenv/shims
fish_add_path /opt/homebrew/opt/trash/bin
fish_add_path $HOME/$WORK_SPACE/dotfiles/bin
fish_add_path $HOME/$WORK_SPACE/bin
fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

set -x NODE_PATH (npm config get prefix)/bin
set -x PYENV_ROOT $HOME/.pyenv

if test -d $PYENV_ROOT/bin
    pyenv init - fish | source
end

alias rm /opt/homebrew/opt/trash/bin/trash

if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
    
    zoxide init fish | source

    fish_add_path /opt/homebrew/share/git-core/contrib/diff-highlight/

    set -x LESS "-R"
    set src_hilite_lesspipe (find /opt/homebrew/Cellar/source-highlight/ -name "src-hilite-lesspipe.sh")
    set -x LESSOPEN "| $src_hilite_lesspipe %s"
end
