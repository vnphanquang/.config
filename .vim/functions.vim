let t:bg_transparent = 0
function! ToggleBgOpacity() 
    if t:bg_transparent == 0
        highlight! Normal guibg=NONE ctermbg=NONE
        highlight! EndOfBuffer guibg=NONE ctermbg=NONE
        let t:bg_transparent = 1
    else
        set background=dark
        let t:bg_transparent = 0
    endif
endfunction
nnoremap <leader>t :call ToggleBgOpacity()<CR>
