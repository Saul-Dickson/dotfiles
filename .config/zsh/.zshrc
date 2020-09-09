if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source <(sheldon source)
source /Users/dickssau000/Library/Preferences/org.dystroy.broot/launcher/bash/br
source /Users/dickssau000/.config/zsh/alias.zsh
source /Users/dickssau000/.config/zsh/init.zsh
source /Users/dickssau000/.config/zsh/vicursor.zsh
source /Users/dickssau000/.config/powerlevel10k/.p10k.zsh
source /usr/local/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
