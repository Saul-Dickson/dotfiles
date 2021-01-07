" Initialize which_key_map
let g:which_key_map = {}

"######################"
"# Which-Key mappings #"
"######################"

nnoremap <silent> <leader><space> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader><space> :WhichKeyVisual '<Space>'<CR>

"##################################"
"# <LEADER> X for delete mappings #"
"##################################"

nnoremap <leader>xw vwhx
nnoremap <leader>xb hvbx
nnoremap <leader>x0 v0x
nnoremap <leader>x$ v$hx

nnoremap <leader>xiw viwx
nnoremap <leader>xi" vi"x
nnoremap <leader>xi' vi'x
nnoremap <leader>xi) vi)x
nnoremap <leader>xi] vi]x
nnoremap <leader>xi} vi}x
nnoremap <leader>xi> vi>x

nnoremap <leader>xx Vx

let g:which_key_map['x'] = {'name': '+remove'}
let g:which_key_map['x']['w'] = 'word'
let g:which_key_map['x']['b'] = 'backword'
let g:which_key_map['x']['0'] = 'till beginning of line'
let g:which_key_map['x']['$'] = 'till end of line'

let g:which_key_map['x']['i'] = {'name': '+inner'}
let g:which_key_map['x']['i']['w'] = 'word'
let g:which_key_map['x']['i']['"'] = 'double-quotes'
let g:which_key_map['x']['i']["'"] = 'single-quotes'
let g:which_key_map['x']['i'][')'] = 'parenthases'
let g:which_key_map['x']['i'][']'] = 'square-bracket'
let g:which_key_map['x']['i']['}'] = 'curly-bracket'
let g:which_key_map['x']['i']['>'] = 'wedge'

let g:which_key_map['x']['x'] = 'line'

"################"
"# Git Commands #"
"################"

nnoremap <leader>gc :Git commit -a<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gs :Git status<CR>

let g:which_key_map['g'] = {'name': '+git'}
let g:which_key_map['g']['c'] = 'commit'
let g:which_key_map['g']['p'] = 'push'
let g:which_key_map['g']['s'] = 'status'

"#################################"
"# Visual Aesthetics Keymappings #"
"#################################"

let g:which_key_map['v'] = {'name': '+visual'}

"## Toggle highlight ##"
nnoremap <leader>vh :noh<CR>

"## Open Startify ##"
nnoremap <leader>vt :Startify<CR>

let g:which_key_map['v']['t'] = 'startify'

"## Refresh Syntax Highlighting ##"
nnoremap <leader>vr :syntax sync fromstart<CR>

let g:which_key_map['v']['r'] = 'refresh'

"## Re-source init.vim ##"
nnoremap <leader>vsi :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>vsc :source %<CR>

let g:which_key_map['v']['s'] = {'name': '+source'}
let g:which_key_map['v']['s']['i'] = 'init.vim'
let g:which_key_map['v']['s']['c'] = 'current'

"## {Max,Min}imize Window ##"
nnoremap <leader>vm :MaximizerToggle<CR> 

let g:which_key_map['v']['m'] = '{min,max}imize'

"## Switch Foldmethods ##"
nnoremap <leader>vfm :set foldmethod=manual<CR>
nnoremap <leader>vfM :set foldmethod=marker<CR>
nnoremap <leader>vfi :set foldmethod=indent<CR>
nnoremap <leader>vfs :set foldmethod=syntax<CR>
nnoremap <leader>vfd :set foldmethod=diff<CR>
nnoremap <leader>vfe :set foldmethod=expr<CR>

let g:which_key_map['v']['f'] = {
            \'name': '+foldmethod',
            \'m': 'manual',
            \'M': 'marker',
            \'i': 'indent',
            \'s': 'syntax',
            \'d': 'diff',
            \'e': 'expr'
\}

"#####################"
"# Window navigation #"
"#####################"

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

let g:which_key_map['h'] = 'window left'
let g:which_key_map['j'] = 'window down'
let g:which_key_map['k'] = 'window up'
let g:which_key_map['l'] = 'window left'

"###################"
"# Window windowment #"
"###################"

nnoremap <leader>H <C-W>H
nnoremap <leader>L <C-W>L
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>T <C-W>T

let g:which_key_map['H'] = 'move window left'
let g:which_key_map['L'] = 'move window right'
let g:which_key_map['J'] = 'move window down'
let g:which_key_map['K'] = 'move window up'
let g:which_key_map['T'] = 'move window new tab'

"####################"
"# Editing Commands #"
"####################"

nnoremap <leader>er :%Subvert/
nnoremap <leader>eR :%substitute/

let g:which_key_map['e'] = {'name': '+edit'}
let g:which_key_map['e']['r'] = 'subvert'
let g:which_key_map['e']['R'] = 'substitute'

"#########################"
"# Undo/Redo keymappings #"
"#########################"

nnoremap <leader>uu :UndotreeToggle<CR>
nnoremap <leader>uf :UndotreeFocus<CR>
nnoremap <S-u> :redo<CR>

let g:which_key_map['u'] = {
            \ 'name': '+undo',
            \ 'u': 'show the Undotree',
            \ 'f': 'focus the Undotree'
            \}

"########################"
"# Floaterm keymappings #"
"########################"

nmap <leader>tt :FloatermToggle<CR>
nnoremap <leader>ta :FloatermNew<CR>
nnoremap <leader>tx :FloatermKill<CR>

let g:which_key_map['t'] = {
            \ 'name': '+terminal',
            \ 't': 'toggle Floaterm',
            \ 'a': 'new Floaterm win',
            \ 'd': 'delete Floaterm win',
            \}

"#####################################"
"# Conquer of Completion keymappings #"
"#####################################"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <tab> & <S-tab> to change selection.
" inoremap <Tab> <C-n>
" inoremap <S-Tab> <S-C-n>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>cac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cqf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR> 

let g:which_key_map['c'] = {
            \ 'name': '+coc',
            \ 'a': 'diagnostics',
            \ 'e': 'extensions',
            \ 'c': 'commands',
            \ 'o': 'outline',
            \ 's': 'symbols',
            \ 'j': 'next',
            \ 'k': 'prev',
            \ 'p': 'list-resume'
            \}

let g:which_key_map['c']['qf'] = 'autofix-line'

let g:which_key_map['c']['a'] = {'name': '+codAction'}
let g:which_key_map['c']['a']['c'] = 'current-line'

let g:which_key_map['c']['r'] = 'rename'

let g:which_key_map['c']['f'] = 'format'


"##############################"
"# File Management Keymapings #"
"##############################"

nnoremap <leader>ff :FloatermNew lf<CR>
nnoremap <leader>ft :CocCommand explorer<CR>

let g:which_key_map['f'] = {
            \ 'name': '+file',
            \ 'f': 'open file manager @ $(pwd)',
            \ 't': 'show file tree',
            \}

"##############"
"# fzf search #"
"##############"

nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :GFiles<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sw :Windows<CR>

let g:which_key_map['s'] = {'name': '+search'}
let g:which_key_map['s']['f'] = 'files'
let g:which_key_map['s']['g'] = 'gitfiles'
let g:which_key_map['s']['b'] = 'buffers'
let g:which_key_map['s']['w'] = 'windows'

"#######################################"
"# Copy/Paste to/from System clipboard #"
"#######################################"

nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

let g:which_key_map['y'] = 'yank->sysclip'
let g:which_key_map['p'] = 'putnext<-sysclip'
let g:which_key_map['P'] = 'putprev<-sysclip'

"####################"
"# Line indentation #"
"####################"

vnoremap <Tab> >)
vnoremap <S-Tab> <

"##########################"
"# Terminal-mode mappings #"
"##########################"

tnoremap <silent> <leader>tt <C-\><C-n>

"###########################"
"# Resize panes vertically #"
"###########################"

nnoremap <leader>wv+ :vertical resize +10<CR>
nnoremap <leader>wv- :vertical resize -10<CR>
nnoremap <leader>wvs :vertical split<CR>
nnoremap <leader>wh+ :resize +10<CR>
nnoremap <leader>wh- :resize -10<CR>
nnoremap <leader>whs :split<CR>

let g:which_key_map.w = {'name': '+window'}
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
