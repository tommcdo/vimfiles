""" Syntastic maps and settings

nnoremap <F6> :SyntasticToggleMode<CR>

" Always populate location list on errors
let g:syntastic_always_populate_loc_list = 1

" Fine-tune PHP checker options
let g:syntastic_php_checkers = ['php']
