" Cursor movement


" ---------------------
" Normal Mode

nnoremap <SPACE> <Nop>
let mapleader=" "

" Moving line
execute "set <A-j>=\ej"
nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> <Esc>:m '>+1<CR>gv=gv

execute "set <A-k>=\ek"
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" Tab switching
"nnoremap <C-1> :tabn 1<CR>
"nnoremap <C-2> :tabn 2<CR>

" Insert Mode

" All
map <C-b> :NERDTreeToggle<CR>
