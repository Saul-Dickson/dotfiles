syntax on

set noerrorbells " ring the bell for error messages
set tabstop=4 softtabstop=4 " number of spaces that <Tab> in file uses/uses while editing
set shiftwidth=4 " number of spaces to use for (auto)indenting step
set expandtab " use spaces when <Tab> is inseted
set smartindent " smart autoindenting for C programs
set nu " print the line number in front of each line
set nowrap " toggle line wrapping (long lines wrap and continue on the next)
set smartcase " no ignore case when pattern has uppercase
set noswapfile " whether to use a swapfile for a buffer
set nobackup " keep backup file after overwriting file
set undodir=~/.config/nvim/undodir " where to store undo files
set undofile " save undo information to a file
set incsearch " highlight match while typing search pattern
set relativenumber " show relative line number in front of each line
set nocursorline " highlight the screen line of the cursor
set autochdir " change directory to the file in the current window
set autoread " automatically read file when changed outside of vim
set clipboard " use the clipboard as the unnamed register
set spell " enable spell checking
set spelllang=en_us " language(s) to de spell checking for
set scrolloff=999 " lock the cursor to the center row

filetype plugin on

"warnings and errors in statusline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
