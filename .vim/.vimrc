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

source ~/.vim/.vim-plug.vim
source ~/.vim/.theme.vim
source ~/.vim/.keymapping.vim

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
