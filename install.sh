sudo /bin/bash -c \ 
    "$(curl \
    -fsSL \
    https://raw.githubusercontent.com\
    /Homebrew/install/master/install.sh)"

brew install bat bit cmake ctags exa fd fzf gh git go@1.14 imagemagick \
    lua make mpv ncurses onefetch ripgrep rust trash vifm tmux \
    youtube-dl wget wren zsh

sudo chsh /usr/local/bin/zsh
