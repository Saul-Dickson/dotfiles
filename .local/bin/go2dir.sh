if [[ $( git root ) != *"not a git repo"* ]]; then
    cd $( fd -t d . --hidden | fzf )
else
    cd $( fd -t d --full-path $( git root ) --hidden | fzf )
fi
