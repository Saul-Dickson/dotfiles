# go environment variables
export GOROOT="/usr/local/Cellar/go/1.15.2"
export GOPATH="$HOME/Projects"
[[ $OSTYPE == *"darwin"* ]] && export GOPATH="$HOME/Library/golib:$GOPATH" || \
    export GOPATH="$HOME/.local/golib:$GOPATH"

# paths
export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH="$HOME/Projects/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
[[ $OSTYPE == *"darwin"* ]] && export PATH="$HOME/Library/golib/bin:$PATH" || \
    export PATH="$HOME/.local/golib/bin:$PATH"
[[ $OSTYPE == *"darwin"* ]] && export PATH="$HOME/Library/cargo/bin:$PATH" || \
    export PATH="$HOME/.local/cargo/bin:$PATH"

# clean home
export ZDOTDIR="$HOME/.config/zsh"
export PYLINTHOME="$HOME/.local/share/pylint.d"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
[[ $OSTYPE == *"darwin"* ]] && export CARGO_HOME="$HOME/Library/cargo" || \
    export CARGO_HOME="$HOME/.local/cargo"
[[ $OSTYPE == *"darwin"* ]] && export RUSTUP_HOME="$HOME/Library/rustup" || \
    export RUSTUP_HOME="$HOME/.local/rustup"
