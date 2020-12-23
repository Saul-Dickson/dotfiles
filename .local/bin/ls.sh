#/usr/bin/env sh

exa -la --icons --group-directories-first --color=always $@ | rg -v "\.DS_Store"
