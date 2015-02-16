""" Fugitive maps and settings

" Standard maps
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gb :Gblame -w -M<CR>
nnoremap <Leader>gg :Git log --graph --all --decorate<CR>

" 'Input pending' maps (start Ex command without <CR>)
nnoremap <Leader>gt :Gtabedit! 

" Delete fugitive buffers when they become hidden
autocmd BufReadPost fugitive://* set bufhidden=delete
