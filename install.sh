## Find the location of the script ##
scriptPath='dirname $0'

## Create symlinks to config files ##
for confName in $(/bin/ls -1 $scriptPath/.config); do
    message="symlinking ~/.config/$confName"
    printf "\r $message"

    ln -sF $(echo $scriptPath)/.config/$(echo $confName) ~/.config/$confName
done


## Create symlink to local shell scripts ##
ln -sF $(echo $scriptPath)/.local/bin ~/.local/bin

## install homebrew ##
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## Install the various packages ##
brew install bat cmake ctags exa fd fzf gh git go imagemagick lua make mpv \
             ncurses onefetch ripgrep rust vifm tmux youtube-dl wget wren \
             zsh hexyl pass neomutt ms-jpq/sad/sad

## Install other, less important packages using pip ##
sudo pip3.9 install epr

## Install other, less important packages using go ##
go get github.com/zquestz/s || sudo !!

## Install other, less important packages using npm ##
npm install --global trash-cli || sudo !!

## Change the default shell to zsh ##
sudo chsh /usr/local/bin/zsh
