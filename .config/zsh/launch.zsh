# vi keybindings
bindkey -v
export KEYTIMEOUT=1

# autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit && _comp_options+=(globdots)
