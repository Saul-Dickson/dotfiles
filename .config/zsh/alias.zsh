# alias python to python3.8
alias python="python3.8"

# alias ls to exa -la --icons --group-directories-first --color=always
alias ls="exa -la --icons --group-directories-first --color=always"

# alias cat to "bat"
alias cat="bat"

# alias ps to "ps aux -c | fzf --preview=\"\""
alias ps="/bin/ps aux -c | fzf --preview=\"\""

# alias neofetch to cat ~/.cache/neofetch
alias neofetch="/bin/cat ~/.cache/neofetch"

# alias mbsync to mbsync -c ~/.config/mbsync/init.mbsync
alias mbsync="mbsync -c ~/.config/mbsync/init.mbsync"
