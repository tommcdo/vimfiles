" Make a local copy of the arglist
nnoremap <Leader>al :arglocal<CR>

" Add current buffer to arglist
nnoremap <Leader>aa :argedit %<CR>

" Start a new local arglist with current buffer
nnoremap <Leader>as :arglocal! %<CR>

" Delete current buffer from arglist
nnoremap <Leader>ad :<C-R>=argidx()+1<CR>argdelete<CR>

" Jump to the current file in the arglist
nnoremap <Leader>ac :argument<CR>

" Add file under cursor to arglist in previous window (useful in :Gstatus window)
nnoremap <Leader>af :wincmd p <Bar> argadd <C-R><C-F> <Bar> wincmd p<CR>

" Start a new local arglist in previous window with file under cursor (useful in :Gstatus window)
nnoremap <Leader>aF :wincmd p <Bar> arglocal! <C-R><C-F> <Bar> wincmd p<CR>

command! -nargs=* -complete=command ArgCmd execute "<args>" | argedit %

function! s:arg_edit(file)
	execute 'argedit '.(a:file == '' ? '%' : a:file)
endfunction

function! s:arglist_complete(A, L, P)
	let arg_to_cursor = strpart(a:L, 11, a:P)
	let space_idx = stridx(arg_to_cursor, ' ')
	if space_idx == -1
		return filter(map(range(argc()), 'argv(v:val)'), 'v:val =~ a:A')
	else
		return []
	endif
endfunction

command! -nargs=? -complete=customlist,s:arglist_complete ArgEdit call s:arg_edit("<args>")

function! s:sargs()
	execute 'arglocal! '.join(map(tabpagebuflist(), 'bufname(v:val)'), ' ')
	execute winnr().'argument'
	execute 'only'
endfunction

command! Sargs call s:sargs()

function! s:to_args(list, bang)
	let l:dict = {}
	for l:item in a:list
		let l:dict[bufname(l:item.bufnr)] = ''
	endfor
	let l:cmd = a:bang == '!' ? 'arglocal!' : 'args'
	echo l:cmd
	silent! execute l:cmd join(keys(l:dict))
endfunction

command! -bang Qargs call s:to_args(getqflist(), "<bang>")
command! -bang Largs call s:to_args(getloclist(0), "<bang>")
