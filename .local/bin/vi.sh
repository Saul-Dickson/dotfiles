[ -f $1 ] && type="file" ||
[ -d $1 ] && type="directory" ||
[ -L $1 ] && cudir=$(pwd) && \
    cd $1 && type="directory" ||
    type="file"; cd $curdir

case $type in
    "file")
        nvim $1
        ;;
    "directory")
        vifm $1
        ;;
esac
