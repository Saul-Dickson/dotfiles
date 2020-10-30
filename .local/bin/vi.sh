[ -z $1 ] &&
    [ -d $1 ] && vifm $@ || \
    [ -L $1 ] && vifm $@ || nvim $@ || \
    [ -z $1 ] && vifm $(pwd) || \
    nvim $@
