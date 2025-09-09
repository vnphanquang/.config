"""
""" Vim configuration for IntelliJ IDEA
""" Required plugins for this setup:
""" - IdeaVim
""" - IdeaVim-EasyMotion
""" - AceJump
""" - Which-Key
"""

nnoremap <SPACE> <Nop>
let mapleader=" "

""" Idea specific settings
set which-key
set ideajoin
set easymotion
set multiple-cursors
set mini-ai

" disable the timeout option
set notimeout

" increase the timeoutlen (default: 1000), don't add space around the equal sign
set timeoutlen=5000

""" Key mappings
" Map jj to Esc
inoremap jj <Esc>

" Window Splitting
noremap <C-w>\\ :vsplit<CR>
noremap <C-w>- :split<CR>

" Move quickly to start / end of line
noremap H ^
noremap L $

" Keep cursor consistent
noremap J mzJ`z
noremap n nzzzv
noremap N Nzzzv
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Yanking & Pasting
noremap Y y$
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>d "_d
xnoremap <leader>p "_dP

