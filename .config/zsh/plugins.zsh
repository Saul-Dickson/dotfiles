# set the plugin directory
PLUGINDIR=~/.config/zsh/plugins

### Zsh Autosuggestions ###
source /usr/local/Cellar/zsh-autosuggestions/0.6.4/share/zsh-autosuggestions/zsh-autosuggestions.zsh

### Zsh Completions ###
source $PLUGINDIR/zsh-completions/zsh-completions.plugin.zsh


### Fast Syntax Highlighting ###
source $PLUGINDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

### History Search Multi-Word ###
source $PLUGINDIR/history-search-multi-word/history-search-multi-word.plugin.zsh

## Set Colorscheme of HSMW ##
typeset -gA HSMW_HIGHLIGHT_STYLES
HSMW_HIGHLIGHT_STYLES[default]="fg:223"
HSMW_HIGHLIGHT_STYLES[unknown-token]="fg:red,bold"
HSMW_HIGHLIGHT_STYLES[commandseparator]="none"
HSMW_HIGHLIGHT_STYLES[redirection]="none"
HSMW_HIGHLIGHT_STYLES[here-string-tri]="fg:yellow"
HSMW_HIGHLIGHT_STYLES[here-string-text]="fg:18"
HSMW_HIGHLIGHT_STYLES[here-string-var]="fg:cyan,bg:18"
HSMW_HIGHLIGHT_STYLES[exec-descriptor]="fg:yellow,bold"
HSMW_HIGHLIGHT_STYLES[comment]="fg:245,bold"
HSMW_HIGHLIGHT_STYLES[correct-subtle]="fg:12"
HSMW_HIGHLIGHT_STYLES[incorrect-subtle]="fg:red"
HSMW_HIGHLIGHT_STYLES[subtle-separator]="fg:106"
HSMW_HIGHLIGHT_STYLES[secondary]="free"
HSMW_HIGHLIGHT_STYLES[reserved-word]="fg:yellow"
HSMW_HIGHLIGHT_STYLES[subcommand]="fg:66"
HSMW_HIGHLIGHT_STYLES[alias]="fg:green"
HSMW_HIGHLIGHT_STYLES[suffix-alias]="fg:green"
HSMW_HIGHLIGHT_STYLES[global-alias]="bg:66"
HSMW_HIGHLIGHT_STYLES[builtin]="fg:green"
HSMW_HIGHLIGHT_STYLES[function]="fg:green"
HSMW_HIGHLIGHT_STYLES[command]="fg:green"
HSMW_HIGHLIGHT_STYLES[precommand]="fg:green"
HSMW_HIGHLIGHT_STYLES[hashed-command]="fg:green"
HSMW_HIGHLIGHT_STYLES[single-sq-bracket]="fg:223"
HSMW_HIGHLIGHT_STYLES[double-sq-bracket]="fg:223"
HSMW_HIGHLIGHT_STYLES[double-paren]="fg:223"
HSMW_HIGHLIGHT_STYLES[path]="fg:66"
HSMW_HIGHLIGHT_STYLES[pathseparator]=""
HSMW_HIGHLIGHT_STYLES[path-to-dir]="fg:66,underline"
HSMW_HIGHLIGHT_STYLES[globbing]="fg:66,bold"
HSMW_HIGHLIGHT_STYLES[globbing-ext]="fg:13"
HSMW_HIGHLIGHT_STYLES[paired-bracket]="bg:66"
HSMW_HIGHLIGHT_STYLES[bracket-level-1]="fg:106,bold"
HSMW_HIGHLIGHT_STYLES[bracket-level-2]="fg:yellow,bold"
HSMW_HIGHLIGHT_STYLES[bracket-level-3]="fg:cyan,bold"
HSMW_HIGHLIGHT_STYLES[single-hyphen-option]="fg:233"
HSMW_HIGHLIGHT_STYLES[double-hyphen=option]="fg:233"
HSMW_HIGHLIGHT_STYLES[back-quoted-argument]="none"
HSMW_HIGHLIGHT_STYLES[single-quoted-argument]="fg:106"
HSMW_HIGHLIGHT_STYLES[double-quoted-argument]="fg:106"
HSMW_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg:66"
HSMW_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg:66"
HSMW_HIGHLIGHT_STYLES[back-or-dollar-quoted-argument]="fg:66"
HSMW_HIGHLIGHT_STYLES[variable]="fg:66"
HSMW_HIGHLIGHT_STYLES[assign]="none"
HSMW_HIGHLIGHT_STYLES[assign-array-bracket]="fg:green"
HSMW_HIGHLIGHT_STYLES[history-expansion]="fg:66,bold"
HSMW_HIGHLIGHT_STYLES[mathvar]="fg:66,bold"
HSMW_HIGHLIGHT_STYLES[mathnum]="fg:132"
HSMW_HIGHLIGHT_STYLES[matherr]="fg:red"
HSMW_HIGHLIGHT_STYLES[forvar]="none"
HSMW_HIGHLIGHT_STYLES[fornum]="fg:magenta"
HSMW_HIGHLIGHT_STYLES[foroper]="fg:yellow"
HSMW_HIGHLIGHT_STYLES[forsep]="fg:yellow,bold"
HSMW_HIGHLIGHT_STYLES[case-input]="fg:green"
HSMW_HIGHLIGHT_STYLES[case-parentheses]="fg:yellow"
HSMW_HIGHLIGHT_STYLES[case-condition]="bg:66"

### Zsh Autocomplete ###
source $PLUGINDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh

### gitstatus is sourced in prompt.zsh ###

### Powerlevel10k Prompt ###
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit $PLUGINDIR/powerlevel10k/.p10k.zsh.
# [[ ! -f $PLUGINDIR/powerlevel10k/.p10k.zsh ]] || source $PLUGINDIR/powerlevel10k/.p10k.zsh
