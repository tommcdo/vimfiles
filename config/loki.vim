function! s:add()
	let pos = getpos('.')
	let item = {
	\	'bufnr': bufnr('%'),
	\	'lnum': pos[1],
	\	'col': pos[2],
	\	'text': getline(pos[1])
	\ }
	call setloclist(0, [item], 'a')
endfunction

function! s:clear()
	call setloclist(0, [], ' ')
endfunction

command! LokiAdd call s:add()
command! LokiClear call s:clear()
