call plug#begin('~/.config/nvim/site/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} "Conquer of Completion
Plug 'morhetz/gruvbox' "gruvbox colorscheme
Plug 'jremmen/vim-ripgrep' "ripgrep
Plug 'vim-fugitive' "git integration
Plug 'leafgarland/typescript-vim' "typescript integration
Plug 'vim-utils/vim-man' "manpages
Plug 'ctrlpvim/ctrlp.vim' "ctrlp
Plug 'mbbill/undotree' "undotree
Plug 'preservim/nerdtree' "basic file tree
Plug 'junegunn/fzf.vim' "fuzzy finder for fuzzy searching
Plug 'tpope/vim-commentary' "comment out things
Plug 'liuchengxu/vista.vim' "tags viewer and symbol navigator
Plug 'dense-analysis/ale' "does lots of stuff like linting, fixing, etc.
Plug 'itchyny/lightline.vim' "lighweight, simple status bar
Plug 'vifm/vifm.vim' "vifm ((neo)Vi(m) file manager) extention for vim
Plug 'edkolev/tmuxline.vim'
Plug 'vimwiki/vimwiki' "personal information wiki extention for vim
Plug 'godlygeek/tabular' "text alignment
Plug 'dhruvasagar/vim-table-mode' "create tables

"python
Plug 'jeetsukumaran/vim-pythonsense' "python specifiic motions and text objects
Plug 'numirias/semshi' "python syntax highlighting
Plug 'Vimjas/vim-python-pep8-indent' "python PEP8 compliant indentation behaviar
Plug 'google/yapf' "python code formatter

call plug#end()
