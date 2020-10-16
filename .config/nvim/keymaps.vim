" Pane navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Show the UndeTree
nnoremap <leader>u :UndotreeShow<CR>

" File Explorer/Manager Keymaps
nnoremap <leader>vv :Vifm<CR>
nnoremap <leader>vs :VsplitVifm<CR>
nnoremap <leader>nn :NERDTreeToggle %/.<CR>
nnoremap <leader>np :NERDTreeToggle<CR>
nnoremap <leader>ps :Rg<SPACE>

" Resize panes vertically, by in/decriments of 5 
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
