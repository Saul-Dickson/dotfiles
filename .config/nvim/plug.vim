call plug#begin('~/.config/nvim/site/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'morhetz/gruvbox' " gruvbox colorscheme
Plug 'jremmen/vim-ripgrep' " ripgrep
Plug 'leafgarland/typescript-vim' " typescript integration
Plug 'vim-utils/vim-man' " manpages
Plug 'ctrlpvim/ctrlp.vim' " ctrlp
Plug 'mbbill/undotree' " undotree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy finder for fuzzy searching
Plug 'tpope/vim-commentary' " comment out things
Plug 'liuchengxu/vista.vim' " tags viewer and symbol navigator
Plug 'dense-analysis/ale' " does lots of stuff like linting, fixing, etc.
Plug 'itchyny/lightline.vim' " lighweight, simple status bar
Plug 'vifm/vifm.vim' " vifm ((neo)Vi(m) file manager) extention for vim
Plug 'vimwiki/vimwiki' " personal information wiki extention for vim
Plug 'godlygeek/tabular' " text alignment
" Plug 'dhruvasagar/vim-table-mode' " create tables
Plug 'jeetsukumaran/vim-pythonsense' " python specifiic motions and text objects
Plug 'Vimjas/vim-python-pep8-indent' " python PEP8 compliant indentation behaviar
Plug 'google/yapf' " python code formatter
" Plug 'ap/vim-buftabline' " buffer tabs
Plug 'justinmk/vim-sneak' " the missing motion of vim
Plug 'tpope/vim-surround' " change the surrounding text of a text block
Plug 'tpope/vim-repeat' " map the '.' register in a way that allows registers to tap into it
Plug 'tpope/vim-unimpaired' " next & previous, enable and disable with [<alphanumeric> and ]<alphanumeric>
Plug 'dart-lang/dart-vim-plugin' " dart support in vim 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " preview markdown files in browser
Plug 'voldikss/vim-floaterm' " Use nvim/vim's builtin terminal in the floating/popup window
Plug 'puremourning/vimspector' " A multi-language debugging system for Vim
Plug 'numirias/semshi' " Semantic Highlighting for Python in Neovim
Plug 'airblade/vim-gitgutter' " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks
Plug 'vim-latex/vim-latex' " Enhanced LaTeX support for Vim
Plug 'sedm0784/vim-you-autocorrect' " Why should smartphones get all the fun?
Plug 'liuchengxu/vim-which-key' " Vim plugin that shows keybindings in popup
Plug 'mhinz/vim-startify' " The fancy start screen for Vim.
Plug 'ryanoasis/vim-devicons' " Adds file type icons to Vim plugins

call plug#end()
