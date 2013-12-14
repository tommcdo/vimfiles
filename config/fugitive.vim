""" Fugitive maps and settings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gb :Gblame -w<CR>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P " Enable Fugitive statusline (adds branch name)
autocmd BufReadPost fugitive://* set bufhidden=delete
