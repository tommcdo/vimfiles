function! s:version_compare(x, y)
	let x = map(split(a:x, '\.'), 'str2nr(v:val)')
	let y = map(split(a:y, '\.'), 'str2nr(v:val)')
	let lenx = len(x)
	let leny = len(y)
	for i in range(0, min([lenx, leny]) - 1)
		if x[i] > y[i]
			return 1
		elseif x[i] < y[i]
			return -1
		endif
	endfor
	return lenx - leny
endfunction

" Use the silver searcher (ag) for :grep if it is available
if executable('ag')
	let s:ag_version = matchlist(split(system('ag --version'), '\n')[0], '\zs\d\+\(\.\d\+\)\+\ze')[0]
	if s:version_compare(s:ag_version, '0.25.0') >= 0
		set grepprg=ag\ --vimgrep
	else
		set grepprg=ag\ --column\ --nogroup\ --nocolor
	endif
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
function! s:grep_list(list, pattern, v, lhs)
	let l:lhs_expressions = {'text': 'v:val.text', 'file': 'bufname(v:val.bufnr)'}
	let l:lhs = l:lhs_expressions[a:lhs]
	let l:op = a:v == '!' ? '!~#' : '=~#'
	let l:filter = l:lhs.' '.l:op.' "'.escape(a:pattern, '"\').'"'
	if a:list == 'q'
		let l:original_size = len(getqflist())
		call setqflist(filter(getqflist(), l:filter))
		let l:new_size = len(getqflist())
	else
		let l:original_size = len(getloclist())
		call setloclist(0, filter(getloclist(0), l:filter))
		let l:new_size = len(getloclist())
	endif
	echo l:original_size 'items trimmed to' l:new_size
endfunction
command! -bang -nargs=* Qgrep call s:grep_list('q', <q-args>, <q-bang>, 'text')
command! -bang -nargs=* Lgrep call s:grep_list('l', <q-args>, <q-bang>, 'text')
command! -bang -nargs=* Qfilter call s:grep_list('q', <q-args>, <q-bang>, 'file')
command! -bang -nargs=* Lfilter call s:grep_list('l', <q-args>, <q-bang>, 'file')
