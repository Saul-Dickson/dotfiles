autocmd BufWinEnter *.py setlocal foldmethod=indent

autocmd BufWinEnter *.md MarkdownPreview
autocmd BufWinEnter *.md setlocal wrap linebreak
autocmd BufWinLeave *.md setlocal nowrap nolinebreak

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
