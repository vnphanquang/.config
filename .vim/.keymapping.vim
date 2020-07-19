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

nnoremap h :startinsert<CR>
nnoremap <SPACE> <Nop>
let mapleader=" "
 
" Horizontal skipping
nnoremap J <S-Left>
nnoremap L <S-Right> 
nnoremap I <C-U>
nnoremap K <C-E>

" Insert Mode
inoremap <C-i> <Esc>

" All
map <C-b> :NERDTreeToggle<CR>

