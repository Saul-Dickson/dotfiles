## Find the location of the script ##
scriptPath='dirname $0'

## Create symlinks for config files ##
ln -sF $(echo $scriptPath)/.config/nvim ~/.config/nvim
ln -sF $(echo $scriptPath)/.config/zsh ~/.config/zsh
ln -sF $(echo $scriptPath)/.config/coc ~/.config/coc
ln -sF $(echo $scriptPath)/.config/bpytop ~/.config/bpytop
ln -sF $(echo $scriptPath)/.config/fsh ~/.config/fsh
ln -sF $(echo $scriptPath)/.config/python ~/.config/python
ln -sF $(echo $scriptPath)/.config/s ~/.config/s
ln -sF $(echo $scriptPath)/.config/neofetch ~/.config/neofetch
ln -sF $(echo $scriptPath)/.config/npm ~/.config/npm
ln -sF $(echo $scriptPath)/.config/tmux ~/.config/tmux
ln -sF $(echo $scriptPath)/.config/vifm ~/.config/vifm
ln -sF $(echo $scriptPath)/.config/git ~/.config/git
ln -sF $(echo $scriptPath)/.config/gops ~/.config/gops
ln -sF $(echo $scriptpath)/.config/bat ~/.config/bat
ln -sF $(echo $scriptpath)/.config/mutt ~/.config/mutt
ln -sF $(echo $scriptPath)/.config/gh ~/.config/gh

## Create symlink to local shell scripts ##
ln -sF $(echo $scriptPath)/.local/bin ~/.local/bin

## install homebrew ##
sudo /bin/bash -c \ 
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## Install the various packages ##
brew install bat cmake ctags exa fd fzf gh git go imagemagick lua make mpv \
             ncurses onefetch ripgrep rust vifm tmux youtube-dl wget wren \
             zsh hexyl pass neomutt

## Install other, less important packages using go ##
go get github.com/zquestz/s

## Install other, less important packages using npm ##
npm install --global trash-cli

## Change the default shell to zsh ##
sudo chsh /usr/local/bin/zsh
