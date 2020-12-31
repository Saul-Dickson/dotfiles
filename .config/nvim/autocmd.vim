autocmd FileType py setlocal foldmethod=indent

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
