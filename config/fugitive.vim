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

" Open a :Gblame window with commit for current line highlighted
function! s:expose(args)
	execute 'Gblame' a:args
	normal C
	execute 'match Search /^'.expand('<cword>').'/'
	wincmd p
endfunction
command! -nargs=* GExpose silent! call s:expose(<q-args>)
nnoremap <Leader>gx :GExpose -w -M<CR>
