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
source ~/.vim/coc.vim
source ~/.vim/functions.vim

