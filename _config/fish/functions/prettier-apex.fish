function prettier-apex
    set -l global_modules (npm root -g)
    prettier \
        --plugin="$global_modules/prettier-plugin-apex/dist/src/index.js" \
        --print-width=120 \
        --use-tabs \
        --tab-width=4 \
        --no-bracket-spacing \
        $argv
end
