## set $gitPath ##
gitPath="$HOME/.local/src/github.com/Saul-Dickson/dotfiles"

## install homebrew ##
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" &&

## Add brew to PATH ##
[[ $OSTYPE != *"darwin"* ]] &&
    export PATH="/home/linuxbrew/.linuxbrew/bin"

## Install the various packages ##
brew install bat cmake ctags exa fd fzf gh git go imagemagick lua make mpv \
             ncurses onefetch ripgrep rust vifm tmux youtube-dl wget wren \
             zsh hexyl pass neomutt neovim

mkdir $HOME/.local/src/github.com/Saul-Dickson -p
git clone https://github.com/Saul-Dickson/dotfiles $gitPath

####################
# Symlink Dotfiles #
####################

## Create symlinks to config files ##
for confName in $(/bin/ls -1 $gitPath/.config); do
    message="symlinking ~/.config/$confName       "
    printf "\r$message"

    ln -sF $(echo $gitPath)/.config/$(echo $confName) ~/.config/$confName
done

## Create symlink to local shell scripts ##
ln -sF $(echo $gitPath)/.local/bin ~/.local/bin

## Create symlink to wallpapers directory ##
ln -sF $(echo $gitPath)/.local/wall ~/.local/wall

## Create symlink to zshenv ##
ln -sF $(echo $gitPath)/.zshenv ~/.zshenv

## Install other, less important packages using pip ##
sudo pip3.9 install epr ueberzug wifi-password

## Install other, less important packages using go ##
go get github.com/zquestz/s

## Install unpackaged applications ##
mkdir -p ".local/apps"

mkdir -p ".local/apps/royalroad-downloader"
wget \
    "https://github.com/Aivean/royalroad-downloader/releases/download/2.2.0/royalroad-downloader-assembly-2.2.0.jar" \
    ~/.local/apps/royalroad-downloader

## Install other, less important packages using npm ##
npm install --global trash-cli

## Change the default shell to zsh ##
sudo chsh /usr/local/bin/zsh
