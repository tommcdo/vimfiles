function! s:list_modified_buffers()
	return filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&modified")')
endfunction

function! s:move_buffer(direction)
	let l:before = s:list_modified_buffers()
	let l:after = copy(l:before)
	call filter(l:before, 'v:val < bufnr("%")')
	call filter(l:after, 'v:val > bufnr("%")')
	let l:combined_buffers = extend(l:after, l:before)
	if len(l:combined_buffers) == 0
		return
	endif
	execute 'buffer' l:combined_buffers[a:direction]
endfunction

function! s:move_to_end(which)
	let l:modified_buffers = s:list_modified_buffers()
	if len(l:modified_buffers) == 0
		return
	endif
	execute 'buffer' l:modified_buffers[a:which]
endfunction

nnoremap <silent> [w :<C-U>call <SID>move_buffer(-1)<CR>
nnoremap <silent> ]w :<C-U>call <SID>move_buffer(0)<CR>
nnoremap <silent> [W :<C-U>call <SID>move_to_end(0)<CR>
nnoremap <silent> ]W :<C-U>call <SID>move_to_end(-1)<CR>
