# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit && _comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# vi mode
bindkey -v
export KEYTIMEOUT=1

# define functions
# for file in $(exa -1 --color=never $HOME/.config/zsh/functions); do
#     alias $file="zsh $file"
# done

# run and cache neofetch at login
# /bin/rm ~/.cache/neofetch
# /usr/local/bin/neofetch >> ~/.cache/neofetch &
# /usr/local/bin/python3.8 -c "print(\"\n\")" &
# /usr/bin/clear

# fullscreen iTerm2 window on it's opening.
# [[ $TERM_PROGRAM == "iTerm.app" ]] && \
# osascript -e '
# tell application "System Events"
#     tell process "iTerm2"
#         key code 126 using (command down, ¬
#                             option down)
#     end tell
# end tell
# '

# open tmux if not already open
# [[ $(tmux ls) == *"(attached)"* ]] || \
#     [[ $(tmux ls) == *"window"* ]] && \
#     tmux attach || tmux
