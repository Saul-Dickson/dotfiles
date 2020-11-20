" Initialize which_key_map
let g:which_key_map = {}

" Window navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

let g:which_key_map['h'] = 'window left'
let g:which_key_map['j'] = 'window down'
let g:which_key_map['k'] = 'window up'
let g:which_key_map['l'] = 'window left'

" Window Movement
nnoremap <leader>wh <C-W>H
nnoremap <leader>wl <C-W>L
nnoremap <leader>wj <C-W>J
nnoremap <leader>wk <C-W>K
nnoremap <leader>wt <C-W>T

let g:which_key_map.w = {'name': '+window'}
let g:which_key_map['w']['h'] = 'move right'
let g:which_key_map['w']['l'] = 'move left'
let g:which_key_map['w']['j'] = 'move down'
let g:which_key_map['w']['k'] = 'move up'
let g:which_key_map['w']['t'] = 'move new tab'

" Tab navigation
nnoremap <leader><Tab> :tabnew<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

let g:which_key_map['<Tab>'] = {'name': 'new tab'}

" Which-Key mappings
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>

" Undo/Redo keymappings
nnoremap <leader>uu :UndotreeShow<CR>
nnoremap <S-u> :redo<CR>

let g:which_key_map['u'] = {
            \ 'name': '+undo',
            \ 'u': 'show the Undotree',
            \}

" Floaterm keymappings
nmap <leader>tt :FloatermToggle<CR>
nnoremap <leader>ta :FloatermNew<CR>
nnoremap <leader>td :FloatermKill<CR>
tnoremap <silent> <C-Esc> <C-\><C-n>

let g:which_key_map['t'] = {
            \ 'name': '+terminal',
            \ 't': 'toggle Floaterm',
            \ 'a': 'new Floaterm win',
            \ 'd': 'delete Floaterm win',
            \}

" File Explorer/Manager Keymaps
nnoremap <leader>fv :Vifm<CR>
nnoremap <leader>fs :VsplitVifm<CR>
nnoremap <leader>ft :CocCommand explorer<CR>
nnoremap <leader>fh :CocCommand explorer ~<CR>

let g:which_key_map['f'] = {
            \ 'name': '+file',
            \ 'v': 'open selected file <vifm',
            \ 's': 'open selected file <vfim in vs',
            \ 't': 'show file tree',
            \ 'h': 'show file tree @ home directory',
            \}

" fzf search
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sr :RG<CR>

let g:which_key_map['s'] = {'name': '+search'}
let g:which_key_map['s']['f'] = 'files'
let g:which_key_map['s']['r'] = '(rip)grep'

" Line indentation
vnoremap <Tab> >)
vnoremap <S-Tab> <

" Resize panes vertically, by in/decriments of 5 )
nnoremap <leader>wv+ :vertical resize +
nnoremap <leader>wv- :vertical resize -
nnoremap <leader>wvs :vertical split<CR>
nnoremap <leader>wh+ :resize +
nnoremap <leader>wh- :resize -
nnoremap <leader>whs :split<CR>

let g:which_key_map['w']['v'] = {
            \ 'name': '+virtical',
            \ '+': 'increase size',
            \ '-': 'decrease size',
            \ 's': 'create virtical split'
            \}
let g:which_key_map['w']['h'] = {
            \ 'name': '+horizontile',
            \ '+': 'increase size',
            \ '-': 'decrease size',
            \ 's': 'create horizontile split'
            \}

" Export which_key_map
call which_key#register('<Space>', "g:which_key_map")
