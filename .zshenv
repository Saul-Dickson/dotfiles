################################
# User Configuration Variables #
################################

## The path to your "projects" directory ##
PROJECTSDIR=$HOME/Projects

################################
# Golang Environment Variables #
################################
export GOROOT="/usr/local/Cellar/go/1.15.3"
export GOPATH="$PROJECTSDIR"
[[ $OSTYPE == *"darwin"* ]] && export GOPATH="$HOME/Library/golib:$GOPATH" || \
    export GOPATH="$HOME/.local/lib/golib:$GOPATH"

#####################
# Add Paths to PATH #
#####################

## Add Various Python bin Folders to Path ##
export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH="/usr/local/Cellar/python@3.8/3.8.6/bin:${PATH}"
export PATH="/usr/local/Cellar/python@3.8/3.8.5/bin:${PATH}"
export PATH="/usr/local/Cellar/python@3.9/3.9.0/bin:${PATH}"

## Add the Dedicated bin dir of your Projects folder to PATH ##
export PATH="$PROJECTSDIR/bin:$PATH" 

## Add ~/.local/bin (location for binaries too small to be packages) ##
## to the PATH Environment Variable                                  ##
export PATH="$HOME/.local/bin:$PATH"

# Add the directory for rustup's bin dir to PATH ##
[[ $OSTYPE == *"darwin"* ]] && export PATH="$HOME/Library/golib/bin:$PATH" || \
    export PATH="$HOME/.local/lib/golib/bin:$PATH"

# Add the directory for rustup's bin dir to PATH ##
[[ $OSTYPE == *"darwin"* ]] && export PATH="$HOME/Library/cargo/bin:$PATH" || \
    export PATH="$HOME/.local/lib/cargo/bin:$PATH"

############################
# Clean the Home Directory #
############################

export ZDOTDIR="$HOME/.config/zsh" # Set the dir of zsh's configuration files
export PYLINTHOME="$HOME/.local/share/pylint.d" # Set the dir for pylint's data storage
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc" # Set the dir for npm configuration files

## Set the directory for cargo's local libraries to $HOME/Library/cargo if    ##
## the system is a mac. Otherwise set the directory to $HOME/.local/lib/cargo ##
[[ $OSTYPE == *"darwin"* ]] && export CARGO_HOME="$HOME/Library/cargo" || \
    export CARGO_HOME="$HOME/.local/lib/cargo"

# Set the directory for rustup's local libraries to $HOME/Library/rustup if   ##
# the system is a mac. Otherwise set the directory to $HOME/.local/lib/rustup ##
[[ $OSTYPE == *"darwin"* ]] && export RUSTUP_HOME="$HOME/Library/rustup" || \
    export RUSTUP_HOME="$HOME/.local/lib/rustup"
