################################
# User Configuration Variables #
################################

## The path to your "projects" directory ##
PROJECTSDIR=$HOME/.local/dev

## The path to your local library directory ##
LIBRARYDIR=$HOME/Library

################################
# Golang Environment Variables #
################################
export GOROOT="/usr/local/Cellar/go/1.15.3"
export GOPATH="$PROJECTSDIR"
export GOPATH="$LIBRARYDIR/golib"

#####################
# Add Paths to PATH #
#####################

## Add Various Python bin Folders to Path ##
export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH="/usr/local/Cellar/python@3.8/3.8.6/bin:${PATH}"
export PATH="/usr/local/Cellar/python@3.8/3.8.5/bin:${PATH}"
export PATH="/usr/local/Cellar/python@3.9/3.9.0/bin:${PATH}"
export PATH="$LIBRARYDIR/Python/3.8/bin:${PATH}"

## Add the Dedicated bin dir of your Projects folder to PATH ##
export PATH="$PROJECTSDIR/bin:$PATH" 

## Add ~/.local/bin (location for binaries too small to be packages) ##
## to the PATH Environment Variable                                  ##
export PATH="$HOME/.local/bin:$PATH"

# Add the directory for rustup's bin dir to PATH ##
export PATH="$LIBRARYDIR/rustup/bin:$PATH"

# Add the directory for rustup's bin dir to PATH ##
export PATH="$LIBRARYDIR/cargo/bin:$PATH"

############################
# Clean the Home Directory #
############################

export ZDOTDIR="$HOME/.config/zsh" # Set the dir of zsh's configuration files
export PYLINTHOME="$HOME/.local/share/pylint.d" # Set the dir for pylint's data storage
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc" # Set the dir for npm configuration files
export PYTHONSTARTUP="$HOME/.config/python/config.py" # Tell python where the init file for it's REPL is located
export VIMSPECTOR_HOME="$HOME/.local/share/vimspector"

## Set the directory for cargo's local libraries to $HOME/Library/cargo if    ##
## the system is a mac. Otherwise set the directory to $HOME/.local/lib/cargo ##
export CARGO_HOME="$LIBRARYDIR/cargo"

## Set the directory for rustup's local libraries to $HOME/Library/rustup if   ##
## the system is a mac. Otherwise set the directory to $HOME/.local/lib/rustup ##
export RUSTUP_HOME="$LIBRARYDIR/rustup"
