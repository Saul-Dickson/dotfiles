call plug#begin('~/.config/nvim/site/plugged')

" Fuzzy Finder Integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy finder for fuzzy searching

" Tpope vim enhancements
Plug 'tpope/vim-commentary' " comment out things
Plug 'tpope/vim-surround' " change the surrounding text of a text block
Plug 'tpope/vim-repeat' " map the '.' register in a way that allows registers to tap into it
Plug 'tpope/vim-unimpaired' " next & previous, enable and disable with [<alphanumeric> and ]<alphanumeric>
Plug 'tpope/vim-abolish' " abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-fugitive' " fugitive.vim: A Git wrapper so awesome, it should be illegal

" Aesthetics for (Neo)VIM
Plug 'itchyny/lightline.vim' " lighweight, simple status bar
Plug 'mhinz/vim-startify' " The fancy start screen for Vim.
Plug 'ryanoasis/vim-devicons' " Adds file type icons to Vim plugins
Plug 'ap/vim-css-color' " Preview colours in source code while editing
Plug 'airblade/vim-gitgutter' " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks
Plug 'morhetz/gruvbox' " gruvbox colorscheme
Plug 'szw/vim-maximizer' " Maximizes and restores the current window in Vim.

" Syntax highlighting & Language Support
Plug 'leafgarland/typescript-vim' " typescript integration
Plug 'vim-latex/vim-latex' " Enhanced LaTeX support for Vim
Plug 'numirias/semshi' " Semantic Highlighting for Python in (Neo)VIM
Plug 'neomutt/neomutt.vim' " vim syntax for neomuttrc
Plug 'dart-lang/dart-vim-plugin' " dart support in vim 
Plug 'sheerun/vim-polyglot' " A solid language pack for Vim.

" Motions
Plug 'justinmk/vim-sneak' " the missing motion of vim
Plug 'liuchengxu/vim-which-key' " Vim plugin that shows keybindings in popup
Plug 'jeetsukumaran/vim-pythonsense' " python specifiic motions and text objects
Plug 'unblevable/quick-scope' " Lightning fast left-right movement in Vim

" Text Editing Plugins & Enhancements
Plug 'mbbill/undotree' " undotree
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'markonm/traces.vim', {'branch': 'subvert'} " Range, pattern and substitute preview for Vim
Plug 'puremourning/vimspector' " A multi-language debugging system for Vim
Plug 'godlygeek/tabular' " text alignment
Plug 'sedm0784/vim-you-autocorrect' " Why should smartphones get all the fun?

" Code Linting, Fixing, and processing
Plug 'Vimjas/vim-python-pep8-indent' " python PEP8 compliant indentation behavior
Plug 'google/yapf' " python code formatter
Plug 'dense-analysis/ale' " does lots of stuff like linting, fixing, etc.

" File Management & Navigation
Plug 'sitiom/lf.vim' " Lf integration in vim and (Neo)VIM
Plug 'ctrlpvim/ctrlp.vim' " ctrlp

" Other
Plug 'jremmen/vim-ripgrep' " ripgrep
Plug 'liuchengxu/vista.vim' " tags viewer and symbol navigator
Plug 'vimwiki/vimwiki' " personal information wiki extention for vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " preview markdown files in browser
Plug 'voldikss/vim-floaterm' " Use nvim/vim's builtin terminal in the floating/popup window

call plug#end()
