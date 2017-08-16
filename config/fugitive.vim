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
augroup FugitiveDeleteBuffers
	autocmd!
	autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Open a :Gblame window with commit for current line highlighted
function! s:expose(args)
	execute 'Gblame' a:args
	normal C
	execute 'match Search /^'.expand('<cword>').'/'
	wincmd p
endfunction
command! -nargs=* GExpose silent! call s:expose(<q-args>)
nnoremap <Leader>gx :GExpose -w -M<CR>

" Enable automatic fold opening/closing for commit buffers
function! s:fold_openclose_on()
	let s:foldopen = &foldopen
	let s:foldclose = &foldclose
	set foldopen=all
	set foldclose=all
endfunction
function! s:fold_openclose_off()
	let &foldopen = s:foldopen
	let &foldclose = s:foldclose
endfunction
augroup FugitiveFoldSettings
	autocmd!
	autocmd BufEnter fugitive://*//[0-9a-f]\\\{7,48\} call s:fold_openclose_on()
	autocmd BufLeave fugitive://*//[0-9a-f]\\\{7,48\} call s:fold_openclose_off()
augroup END
