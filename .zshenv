## Launch tmux at login ##
[[ $(/usr/local/bin/tmux ls) == *"attached"* ]] || 
    sleep 0.5 &&
    $(/usr/local/bin/tmux -2 attach || /usr/local/bin/tmux -2)

################################
# User Configuration Variables #
################################

## The path to your local library directory ##
LIBRARYDIR=$HOME/Library

## The name of your prefered editor ##
export EDITOR="nvim"

## The name of your prefered pager ##
export PAGER="bat"

## The name of your prefered browser ##
export BROWSER="/Applications/Microsoft Edge Beta.app/Contents/MacOS/Microsoft\ Edge\ Beta"

######################
# XDG_HOME Variables #
######################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

#############################
# FZF Environment Variables #
#############################
export FZF_DEFAULT_OPTS='--preview "bat --plain --color=always {}" --layout=reverse --border=rounded'
export FZF_DEFAULT_COMMAND='fd --type f --hidden'

################################
# Golang Environment Variables #
################################
export GOROOT="/usr/local/Cellar/go/1.15.3/libexec"
export GOPATH="$LIBRARYDIR/golib:$HOME/.local"

#####################
# Add Paths to PATH #
#####################

## Add Various Python bin Folders to Path ##

[[ $OSTYPE == *"darwin"* ]] && 
    export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"

for i in $(/bin/ls -1 $LIBRARYDIR/Python); do
    export PATH="$LIBRARYDIR/Python/$i/bin:$PATH"
done

for i in $(/bin/ls -1 /usr/local/Cellar | /usr/local/bin/rg "python"); do 
    for d in $(/bin/ls -1 /usr/local/Cellar/$i); do 
        export PATH="/usr/local/Cellar/$i/$d/bin:$PATH"
    done
done

## Add ~/.local/bin (location for binaries too small to be packages) ##
## to the PATH Environment Variable                                  ##
export PATH="$HOME/.local/bin:$PATH"

# Add the directory for rustup's bin dir to PATH ##
export PATH="$LIBRARYDIR/rustup/bin:$PATH"

# Add the directory for rustup's bin dir to PATH ##
export PATH="$LIBRARYDIR/cargo/bin:$PATH"

# Add the directory for golang's bin dir to PATH ##
export PATH="$LIBRARYDIR/golib/bin:$PATH"

############################
# Clean the Home Directory #
############################

export ZDOTDIR="$XDG_CONFIG_HOME/zsh" # Set the dir of zsh's configuration files
export PYLINTHOME="$HOME/.local/share/pylint.d" # Set the dir for pylint's data storage
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc" # Set the dir for npm configuration files
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/config.py" # Tell python where the init file for it's REPL is located
export VIMSPECTOR_HOME="$HOME/.local/share/vimspector" # Set the dir for vimspector's log files
export _ZL_DATA="$HOME/.local/share/z.lua/zlua" # Set the location for z.lua's log file
export LESSHISTFILE="$HOME/.local/share/less/lesshst" # Set the location of the lesshst file
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey" # Set the location of the lesskey file
export WD_CONFIG="$XDG_CONFIG_HOME/wd/init.warprc"
export PASSWORD_STORE_DIR="$HOME/.local/share/pass/store"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/config.notmuch"

## Set the directory for cargo's local libraries to $HOME/Library/cargo if    ##
## the system is a mac. Otherwise set the directory to $HOME/.local/lib/cargo ##
export CARGO_HOME="$LIBRARYDIR/cargo"

## Set the directory for rustup's local libraries to $HOME/Library/rustup if   ##
## the system is a mac. Otherwise set the directory to $HOME/.local/lib/rustup ##
export RUSTUP_HOME="$LIBRARYDIR/rustup"
