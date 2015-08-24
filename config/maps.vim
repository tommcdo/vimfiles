" Insert base filename (no path, no extension)
inoremap <expr> <C-R><Space> expand('%:t:r')
cnoremap <expr> <C-R><Space> expand('%:t:r')

" Switch to alternate file
nnoremap <Space> <C-^>
