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

# resize the iTerm2 window if iTerm2 is open
/usr/bin/osascript -e '
tell application "Finder"
    set resolution to bounds of window of desktop
end tell

tell application "System Events"
    tell process "iTerm2"
        tell window 1
            set position to {10, 10}
            set size to {item 3 of resolution - 20, ¬
                         item 4 of resolution - 20}
        end tell
    end tell
end tell
'

# run and cache neofetch at login
/bin/rm ~/.cache/neofetch
/usr/local/bin/neofetch >> ~/.cache/neofetch
/usr/local/bin/python3.8 -c "print(\"\n\")"
cat ~/.cache/neofetch
