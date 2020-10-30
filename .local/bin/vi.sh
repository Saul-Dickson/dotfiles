[ -z $1 ] &&
    [ -d $1 ] && vifm $@ ; exit || 
    [ -L $1 ] && vifm $@ ; exit || 
        nvim $@ ; exit || 
    \
    [ -z $1 ] && vifm . ; exit || 
    nvim $@
