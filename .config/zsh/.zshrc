#!/usr/bin/env zsh
# source <(sheldon source)

# source all aliases made in alias.zsh
source ~/.config/zsh/alias.zsh

# run commands for settings and precommands
source ~/.config/zsh/settings.zsh

# change the cursor depending on vi-mode
source ~/.config/zsh/vicursor.zsh

# define the prompt variable
source ~/.config/zsh/prompt.zsh

# source install plugins
source ~/.config/zsh/plugins.zsh

# source completions
fpath=($HOME/.config/zsh/completions $fpath)
autoload -Uz commpinit
