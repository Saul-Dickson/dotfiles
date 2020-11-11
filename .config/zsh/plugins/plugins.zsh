# set the plugin directory
PLUGINDIR=~/.config/zsh/plugins

### Zsh Autosuggestions ###
source $PLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

### Zsh Completions ###
source $PLUGINDIR/zsh-completions/zsh-completions.plugin.zsh


### Fast Syntax Highlighting ###
source $PLUGINDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

### Zsh Autocomplete ###
source $PLUGINDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh

### Zsh Abbreviations ###
source $PLUGINDIR/zsh-abbr/zsh-abbr.zsh

### z.lua chdir plugin ###
source $PLUGINDIR/z.lua/z.lua.plugin.zsh

### gitstatus is sourced in prompt.zsh ###

### Powerlevel10k Prompt ###
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit $PLUGINDIR/powerlevel10k/.p10k.zsh.
# [[ ! -f $PLUGINDIR/powerlevel10k/.p10k.zsh ]] || source $PLUGINDIR/powerlevel10k/.p10k.zsh
