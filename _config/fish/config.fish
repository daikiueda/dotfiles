set -f WORK_SPACE "workspace"

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

set -x JAVA_HOME (/usr/libexec/java_home -v 17)

alias rm /opt/homebrew/opt/trash/bin/trash

function display-toggle --description '外部モニターの解像度を 2560x1440 / 3008x1692 でトグル'
    set -l monitor B4A29C08-54BA-444A-B362-1B0BEB9CEF7D
    # 内蔵は1470x956なので、外部の2560x1440判定とは衝突しない
    if displayplacer list | grep -q 'Resolution: 2560x1440'
        displayplacer "id:$monitor res:3008x1692 hz:60 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0"
        echo '外部モニター → 3008x1692'
    else
        displayplacer "id:$monitor res:2560x1440 hz:60 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0"
        echo '外部モニター → 2560x1440'
    end
end

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

    zoxide init fish | source
end
export PATH="$HOME/.local/bin:$PATH"
