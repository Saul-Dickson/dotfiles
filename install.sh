## Find the location of the script ##
scriptPath='dirname $0'

## install homebrew ##
sudo /bin/bash -c \ 
    "$(curl \
    -fsSL \
    https://raw.githubusercontent.com\
    /Homebrew/install/master/install.sh)"

## Install the various packages ##
brew install bat bit cmake ctags exa fd fzf gh git go@1.14 imagemagick \
    lua make mpv ncurses onefetch ripgrep rust vifm tmux youtube-dl \
    wget wren zsh

## Install other, less important packages using go ##
go get github.com/zquestz/s

## Install other, less important packages using npm ##
npm install --global trash-cli

## Change the default shell to zsh ##
sudo chsh /usr/local/bin/zsh

## Create symlinks for config files ##
ln -sF {$scriptPath}/.config/nvim ~/.config/nvim
ln -sF {$scriptPath}/.config/zsh ~/.config/zsh
ln -sF {$scriptPath}/.config/coc ~/.config/coc
ln -sF {$scriptPath}/.config/bpytop ~/.config/bpytop
ln -sF {$scriptPath}/.config/fsh ~/.config/fsh
ln -sF {$scriptPath}/.config/python ~/.config/python
ln -sF {$scriptPath}/.config/s ~/.config/s
ln -sF {$scriptPath}/.config/neofetch ~/.config/neofetch
ln -sF {$scriptPath}/.config/npm ~/.config/npm
ln -sF {$scriptPath}/.config/tmux ~/.config/tmux
ln -sF {$scriptPath}/.config/vifm ~/.config/vifm
ln -sF {$scriptPath}/.config/git ~/.config/git
ln -sF {$scriptPath}/.config/dart ~/.config/dart
ln -sF {$scriptPath}/.config/gops ~/.config/gops

## Create symlink to local shell scripts ##
ln -sF {$scriptPath}/.local/bin ~/.local/bin
