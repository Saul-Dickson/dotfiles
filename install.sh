## set $gitPath ##
gitPath="$HOME/.local/src/github.com/Saul-Dickson/dotfiles"

function packInstall() {

    if [ $(cat /etc/issue | grep "Arch Linux" > /dev/null && echo "true") = "true" ]; then

        # Install packages from the official Arch mirrors.
        sudo pacman -S - < $gitPath/arch_packages.txt

        # Install the paru AUR helper
        git clone https://aur.archlinux.org/paru.git $HOME/Downloads/aur.archlinux.org/paru-bin
        cd $HOME/Downloads/aur.archlinux.org/paru-bin
        makepkg -sir

        cd $gitPath

        # Install unofficial packages from the AUR
        paru -S - < $gitpath/arch_packages-unofficial.txt

    fi
}

function unpackInstall() {
    ## Install unpackaged applications ##

    # Install lightdm theme and config
    git clone https://github.com/Saul-Dickson/modern $HOME/.local/src/github.com/Saul-Dickson/modern
    sudo git clone -l $HOME/.local/src/github.com/Saul-Dickson/modern /usr/share/lightdm-webkit/themes/modern 

    sudo cp $gitPath/etc/lightdm/* /etc/lightdm/

}

# function systemdEnable() {
#     sudo systemctl enable
# }

function scriptInstall() {
    ## Install Scripts ##
    curl "https://raw.githubusercontent.com/tremby/imgur.sh/main/imgur.sh" >> $gitPath/.local/bin/,imgur

    ## Make all scripts executable ##
    for file in $(/bin/ls -1 $gitPath/.local/bin); do
        chmod +x $gitpath/.local/bin/$file
    done
}

function symlinkDots() {
    ## Create symlinks to config files ##
    for confDir in $(/bin/ls -1 $gitPath/.config); do
        message="symlinking $HOME/.config/$confDir       "
        printf "\r$message"

        [ -h $HOME/.local/$confDir ] ||
            ln -sF $(echo $gitPath)/.config/$(echo $confDir) $HOME/.config/$confDir
    done

    sudo cp $gitPath/etc/pacman.conf /etc/pacman.conf

    ## Create symlinks to .desktop applications ##

    [ -d $HOME/.local/share/applications ] || mkdir -p $HOME/.local/share/applications

    for app in $(/bin/ls -1 $gitPath/.local/share/applications); do
        message="symlinking $HOME/.local/share/applications/$app      "
        printf "\r$message"

        [ -h $HOME/.local/share/applications/$app ] ||
            ln -sF $(echo $gitpath)/.local/share/applications/$app \
                    $HOME/.local/share/applications/$app
    done

    ## Create symlinks to icons ##

    [ -d $HOME/.local/share/icons ] || mkdir -p $HOME/.local/share/icons
    [ -d $HOME/.icons ]             || mkdir -p $HOME/.icons

    fd -Hd 1 -a '' $gitPath/.local/share/icons --exec ln -sF \
        $gitPath/.local/share/icons/{} $HOME/.local/share/icons/{}

    fd -Hd 1 -a '' $gitPath/.local/share/icons --exec ln -sF \
        $gitPath/.local/share/icons/{} $HOME/.icons/{}

    ## Create symlinks to local shell scripts ##

    [ -d $HOME/.local/bin ] || mkdir $HOME/.local/bin

    for script in $(/bin/ls -1 $gitPath/.local/bin); do
        message="symlinking $HOME/.local/bin/$script"
        printf="\r$message"

        [ -h $HOME/.local/bin/$script ] ||
            ln -sF $gitPath/.local/bin/$script $HOME/.local/bin/$script
    done

    ## Create symlink to install.sh in .local/bin ##
    [ -h $HOME/.local/bin/install.sh ] || ln -sF $(echo $gitPath)/install.sh $HOME/.local/bin/install.sh

    ## Create symlink to wallpapers directory ##
    [ -h $HOME/.local/wall ] || ln -sF $(echo $gitPath)/.local/wall $HOME/.local/wall

    ## Create symlink to zshenv ##
    [ -h $HOME/.zshenv ] || ln -sF $(echo $gitPath)/.zshenv $HOME/.zshenv
    
    ## Create symlink to Xresources ## 
    [ -h $HOME/.Xresources ] || ln -sF $(echo $gitPath)/.Xresources $HOME/.Xresources
}

function changeShell() {
    ## Change the default shell to zsh ##
    sudo chsh /usr/local/bin/zsh
}

function mkDirs() {
    ## Create directories for configuration, data storage and caching ##
    mkdir $HOME/.cache/zsh # Zsh Caching
    mkdir $HOME/.cache/nvim # NeoVIM UndoTrees
    mkdir $HOME/.local/share/vim
    mkdir $HOME/.local/share/nvim
    mkdir $HOME/.local/share/mail
    mkdir $HOME/.local/share/lf
    mkdir $HOME/.local/share/Steam
    mkdir $HOME/.local/share/pass
    mkdir $HOME/.local/share/mail
}

for arg in $@; do
    case $arg in
        -h|-help)
            echo "-p          Install packages with various package managers"
            echo "-P          Install unpackaged programs"
            echo "-s          Install scripts"
            echo "-S          Symlink dotfiles"
            echo "-c          Change user shell from bash to zsh"
            echo "-d          Make configuration, data storage and caching directories"
            echo "--install   Install all, symlink dotfiles, change user shell and create directories"
            echo "-h, --help  Display this message."
            ;;
        -p) packInstall;;
        -P) upackInstall;;
        -s) scriptInstall;;
        -S) symlinkDots;;
        -c) changeShell;;
        -d) mkDirs;;
        --install) 
            [[ $@ != *"-p"* ]] && packInstall;
            [[ $@ != *"-P"* ]] && unpackInstall;
            [[ $@ != *"-s"* ]] && scriptInstall;
            [[ $@ != *"-S"* ]] && symlinkDots;
            [[ $@ != *"-c"* ]] && changeShell;
            [[ $@ != *"-d"* ]] && mkDirs;;
    esac
done
