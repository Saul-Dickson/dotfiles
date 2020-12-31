##################
# Python Aliases #
##################

## alias python to python3.8 ##
alias python="python3.9"

## alias pip to sudo pip3.9 ##
alias pip="sudo pip3.9"

###############
# FZF Aliases #
###############

## alias ps to "ps aux -c | fzf --preview=\"\"" ##
alias ps="/bin/ps aux -c | fzf --preview=\"\""

## alias kill to "os ax -c "

## alias vi to fd -t f --full-path $( git root || pwd ) --hidden | fzf | xargs nvim ##
alias vi='fd -t f --full-path $( git root || pwd ) --hidden | fzf | xargs nvim'

## alias source to x=$(fd -t f --full-path $(git root) --hidden | fzf); source $x ##
alias src='x=$(fd -t f --full-path $(git root) --hidden | fzf); source $x'

##########################
# Miscellaneous Aliases # 
##########################

## alias neofetch to cat ~/.cache/neofetch ##
alias neofetch="/bin/cat ~/.cache/neofetch"

## alias mbsync to mbsync -c ~/.config/mbsync/init.mbsync ##
alias mbsync="mbsync -c ~/.config/mbsync/init.mbsync"

## alias ls to "~/.local/bin/ls.sh" ##
alias ls="~/.local/bin/ls.sh"

## alias cat to "bat" ##
alias cat="bat"
