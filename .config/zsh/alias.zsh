##################
# Python Aliases #
##################

## alias python to "python3.8" ##
alias python="python3.9"

## alias pip to "sudo pip3.9" ##
alias pip="sudo pip3.9"

###############
# FZF Aliases #
###############

## alias ps to "ps aux -c | fzf --preview=\"\"" ##
alias ps="/bin/ps aux -c | fzf --preview=\"\""

## alias kill to "ps xc | fzf --preview=\"\" | awk '// {print $1} | xargs kill" ##
# alias kill="/bin/ps xc | fzf --preview=\"\" | awk \'// {print $0}\' | xargs /bin/kill"

## alias vi to "fd -t f --full-path $( git root || pwd ) --hidden | fzf | xargs nvim" ##
alias vi='fd -t f -L --full-path $( git root || pwd ) --hidden -E ".git" -E ".cache" | fzf | xargs nvim'

## alias source to "x=$(fd -t f --full-path $( git root || pwd ) --hidden | fzf); source $x" ##
alias src='x=$(fd -t f -L --full-path $( git root || pwd ) --hidden -E ".git" -E ".cache" | fzf); source $x'

##########################
# Miscellaneous Aliases # 
##########################

## alias mutt to "neomutt" ##
alias mutt="neomutt"

## alias neofetch to "cat ~/.cache/neofetch" ##
alias neofetch="/bin/cat ~/.cache/neofetch"

## alias mbsync to "mbsync -c ~/.config/mbsync/init.mbsync" ##
alias mbsync="mbsync -c ~/.config/mbsync/init.mbsync"

## alias ls to "~/.local/bin/ls.sh" ##
alias ls="~/.local/bin/ls.sh"

## alias cat to "bat" ##
alias cat="bat"
