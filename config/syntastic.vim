""" Syntastic maps and settings

nnoremap <F6> :SyntasticToggleMode<CR>

" Always populate location list on errors
let g:syntastic_always_populate_loc_list = 1

" Configure active/passive modes
let g:syntastic_mode_map = {
	\ 'mode': 'active',
	\ 'passive_filetypes': ['javascript']
\ }
