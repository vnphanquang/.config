" Cursor movement
"nnoremap i :call cursor(line('.') - 1, col('.'))<CR>
"nnoremap k :call cursor(line('.') + 1, col('.'))<CR>
"nnoremap j :call cursor(line('.'), col('.') - 1)<CR>
"nnoremap l :call cursor(line('.'), col('.') + 1)<CR>

nnoremap i <Up>
nnoremap k <Down>
nnoremap j <Left>
nnoremap l <Right>

vnoremap i <Up>
vnoremap k <Down>
vnoremap j <Left>
vnoremap l <Right>

" ---------------------
" Normal Mode

nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <C-i> :startinsert<CR>

" Moving line
" nnoremap <A-i> :m .-2<CR>==
" nnoremap <A-k> :m .+1<CR>==

" Insert Mode
"inoremap kk <Esc>l
"nnoremap ii :startinsert<CR>
nnoremap <C-i> :startinsert<CR>

" All
map <C-b> :NERDTreeToggle<CR>

