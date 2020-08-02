syntax on

" General Settings
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab               | " convert tabs to spaces
set autoindent
set smartindent
set number                  | " display absolute display line number
set relativenumber          | " display relative line number
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch                | " highlight search

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set encoding=UTF-8

source ~/.vim/vim-plug.vim
source ~/.vim/theme.vim
source ~/.vim/keymapping.vim
source ~/.vim/functions.vim
source ~/.vim/coc.vim

" Auto open nerdtree if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
let NERDTreeShowHidden=1
let g:plug_window = 'noautocmd vertical topleft new'
