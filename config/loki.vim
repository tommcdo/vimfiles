function! s:add(text, bang)
	let pos = getpos('.')
	let text = a:text
	if text == ''
		let text = getline(pos[1])
	endif
	let item = {
	\	'bufnr': bufnr('%'),
	\	'lnum': pos[1],
	\	'col': pos[2],
	\	'text': text
	\ }
	if a:bang == '!'
		call setqflist([item], 'a')
	else
		call setloclist(0, [item], 'a')
	endif
endfunction

function! s:clear(bang)
	if a:bang == '!'
		call setqflist([], ' ')
	else
		call setloclist(0, [], ' ')
	endif
endfunction

command! -nargs=* -bang LokiAdd call s:add(<q-args>, <q-bang>)
command! -bang LokiClear call s:clear(<q-bang>)
