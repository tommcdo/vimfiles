" Use the silver searcher (ag) for :grep if it is available
if executable('ag')
	set grepprg=ag\ --column\ --nogroup\ --nocolor
	set grepformat=%f:%l:%c:%m
" Or use ack
elseif executable('ack')
	set grepprg=ack\ --column\ --nogroup\ --nocolor
	set grepformat=%f:%l:%c:%m
	let g:grep_fallback = 'ack'
else
	let g:grep_fallback = 'grep'
endif

function! s:search(literal)
	let type = a:literal ? 'literal' : 'pattern'
	let str = input('Search ('.type.'): ')
	if str != ''
		let flag = a:literal ? '-Q ' : ''
		execute 'grep '.flag.'"'.substitute(str, '"', '\\"', 'g').'"'
	endif
endfunction

" Create some mappings for searching (not yet implemented for grep)
if !exists('g:grep_fallback') || g:grep_fallback != 'grep'
	nnoremap <Leader>s :<C-U>call <SID>search(0)<CR>
	nnoremap <Leader>S :<C-U>call <SID>search(1)<CR>
endif

" Add a few commands to grep the quickfix and location lists
function! s:grep_list(list, pattern, v)
	let l:op = a:v == '!' ? '!~#' : '=~#'
	let l:filter = 'v:val.text '.l:op.' "'.substitute(a:pattern, '"', '\\"', 'g').'"'
	if a:list == 'q'
		call setqflist(filter(getqflist(), l:filter))
	else
		call setloclist(0, filter(getloclist(0), l:filter))
	endif
endfunction
command! -bang -nargs=* Qgrep call s:grep_list('q', '<args>', '<bang>')
command! -bang -nargs=* Lgrep call s:grep_list('l', '<args>', '<bang>')
