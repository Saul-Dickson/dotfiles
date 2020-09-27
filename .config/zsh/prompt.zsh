### source gitstatus ### 
source ~/.config/zsh/plugins/gitstatus/gitstatus.prompt.zsh

### define prompt variables ###

## define the current-woking-directory display ##
directory_display='%F{66}%2~%f' 
# the current working directory and its parent directory
# are printed as parent/current. If the parent directory
# is the home directory, it is printed as "~", if the 
# current working directory is the home directory, the
# string printed consists only of the "~" symbol. The
# string will always be colored with the termcolor 66.

## define the symbols for the prompt ##
prompt_symbols='%(?.%F{green}%(!.#.=>).%F{red}%(!.#.=>))%f'
# prompt symbol is "#" if the current shell is privelaged
# symbol is "=>" otherwise. If the last command returned
# with an error, the symbol is colored red, otherwise the
# symbol is green.

PROMPT='$directory_display $prompt_symbols '
RPROMPT='$GITSTATUS_PROMPT'
