autocmd FileType *.py setlocal foldmethod=indent

autocmd BufWinEnter *.md MarkdownPreview

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
