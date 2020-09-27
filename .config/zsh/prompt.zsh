### setup git integration using vcs_info ###

## load vcs_info ##
autoload -Uz vcs_info

## enable git and svn for vcs_info ##
zstyle ':vcs_info:*' enable git svn

## call vcs_info in precmd ##
setopt prompt_subst
precmd() { vcs_info }

## format string of vcs_info_msg_0 ##
zstyle ':vcs_info:git*' formats "%F{245}%r(%b)%f"

# setup PROMPT and RPROMPT
directory_display='%F{66}%2~%f' # Setup working directory display
prompt_symbols='%(?.%F{green}%(!.#.=>).%F{red}%(!.#.=>))%f'
PROMPT='$directory_display $prompt_symbols '
RPROMPT='${vcs_info_msg_0_}'
