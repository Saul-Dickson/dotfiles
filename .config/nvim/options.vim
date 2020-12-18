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
set undodir=~/.cache/nvim/undodir " where to store undo files
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
set cursorline " highlight the line under the cursor
set mouse=nvi  " enable the use of mouse clicks

filetype plugin on

"#######################"
"# Statusline settings #"
"#######################"
set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
