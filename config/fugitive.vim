""" Fugitive maps and settings

" Standard maps
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gb :Gblame -w<CR>

" 'Input pending' maps (start Ex command without <CR>)
nnoremap <Leader>gt :Gtabedit! 

" Enable Fugitive statusline (adds branch name)
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Delete fugitive buffers when they become hidden
autocmd BufReadPost fugitive://* set bufhidden=delete
