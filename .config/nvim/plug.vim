call plug#begin('~/.config/nvim/site/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'morhetz/gruvbox' " gruvbox colorscheme
Plug 'jremmen/vim-ripgrep' " ripgrep
Plug 'leafgarland/typescript-vim' " typescript integration
Plug 'vim-utils/vim-man' " manpages
Plug 'ctrlpvim/ctrlp.vim' " ctrlp
Plug 'mbbill/undotree' " undotree

" Fuzzy Finder Integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy finder for fuzzy searching

" Tpope vim enhancements
Plug 'tpope/vim-commentary' " comment out things
Plug 'tpope/vim-surround' " change the surrounding text of a text block
Plug 'tpope/vim-repeat' " map the '.' register in a way that allows registers to tap into it
Plug 'tpope/vim-unimpaired' " next & previous, enable and disable with [<alphanumeric> and ]<alphanumeric>
Plug 'tpope/vim-abolish' " abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word

Plug 'liuchengxu/vista.vim' " tags viewer and symbol navigator
Plug 'dense-analysis/ale' " does lots of stuff like linting, fixing, etc.
Plug 'itchyny/lightline.vim' " lighweight, simple status bar
Plug 'vimwiki/vimwiki' " personal information wiki extention for vim
Plug 'godlygeek/tabular' " text alignment
Plug 'jeetsukumaran/vim-pythonsense' " python specifiic motions and text objects
Plug 'Vimjas/vim-python-pep8-indent' " python PEP8 compliant indentation behaviar
Plug 'google/yapf' " python code formatter
Plug 'justinmk/vim-sneak' " the missing motion of vim
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
Plug 'neomutt/neomutt.vim' " vim syntax for neomuttrc
Plug 'ap/vim-css-color' " Preview colours in source code while editing
Plug 'ptzz/lf.vim' " Lf integration in vim and neovim
Plug 'markonm/traces.vim' " Range, pattern and substitute preview for Vim

call plug#end()
