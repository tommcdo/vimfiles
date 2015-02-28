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
