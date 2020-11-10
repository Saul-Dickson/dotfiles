" Window navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Window Movement
nnoremap <leader>H <C-W>H
nnoremap <leader>L <C-W>L
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>T <C-W>T

" Tab navigation
nnoremap <leader><Tab> :tabnew<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" Undo/Redo keymappings
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <S-u> :redo<CR>

" Floaterm keymappings
nnoremap <leader>tt :FloatermToggle<CR>
nnoremap <leader>ta :FloatermNew<CR>
nnoremap <leader>td :FloatermKill<CR>
tnoremap <silent> <C-Esc> <C-\><C-n>

" File Explorer/Manager Keymaps
nnoremap <leader>vv :Vifm<CR>
nnoremap <leader>vs :VsplitVifm<CR>
nnoremap <leader>nn :CocCommand explorer<CR>
nnoremap <leader>np :CocCommand explorer ~<CR>

" ripgrep search
nnoremap <leader>ps :Rg<SPACE>

" Line indentation
vnoremap <Tab> >
vnoremap <S-Tab> <

" Resize panes vertically, by in/decriments of 5 
nnoremap <leader>+ :vertical resize +
nnoremap <leader>- :vertical resize -
