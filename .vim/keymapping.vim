" Cursor movement


" ---------------------
" Normal Mode

nnoremap <SPACE> <Nop>
let mapleader=" "

" Moving line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==

" Tab switching
"nnoremap <C-1> :tabn 1<CR>
"nnoremap <C-2> :tabn 2<CR>

" Insert Mode

inoremap jj <Esc>

" All
map <C-b> :NERDTreeToggle<CR>

" Keep cursor consistent
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap H ^
onoremap H ^
nnoremap L $
onoremap L $
