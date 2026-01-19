#!/usr/bin/env zsh
# source <(sheldon source)

# source all wrappers in wrapper.zsh
source $HOME/config/zsh/wrapper.zsh

# source all aliases made in alias.zsh
source $HOME/config/zsh/alias.zsh

# run commands for settings and precommands
source $HOME/config/zsh/settings.zsh

# change the cursor depending on vi-mode
source $HOME/config/zsh/vicursor.zsh

# define the prompt variable
source $HOME/config/zsh/prompt.zsh

# source install plugins
source $HOME/config/zsh/plugins.zsh

# source completions
fpath=($HOME/.config/zsh/completions $fpath)
autoload -Uz commpinit
