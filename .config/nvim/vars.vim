if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=' '
let g:netrw_browse_splite=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0
let g:ale_linters={
            \ "python": ['flake8', 'pylint']
            \}
let g:ale_fixers={
            \'python': ['yapf']
                \}
let g:ale_fix_on_save=1
