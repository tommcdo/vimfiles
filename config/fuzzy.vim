""" s:fuzzy search

function! s:fuzzy(text)
	call s:fuzzy_clear()
	let text = '\c'.substitute(a:text, '.\zs', '.\\{-}', 'g')[:-6]
	let b:fuzzy_last = text
	call search(text)
	call s:fuzzy_hl(a:text)
	let @/ = text
	execute "nnoremap n :<C-U>call <SID>fuzzy_n('n', '".escape(a:text, "'")."')<CR>"
	execute "nnoremap N :<C-U>call <SID>fuzzy_n('N', '".escape(a:text, "'")."')<CR>"
	nnoremap <silent> <Esc> :<C-U>call <SID>fuzzy_cancel()<CR>
endfunction

function! s:fuzzy_hl(text)
	let l:pos = [line("."), col(".")]
	let b:fuzzy_matches = []
	let l:pattern_accum = '\c\%'.l:pos[0].'l\%'.l:pos[1].'c'
	for l:i in range(0, strlen(a:text) - 1)
		let l:pattern = l:pattern_accum.'\zs'.a:text[l:i].'\ze'
		let b:fuzzy_matches += [matchadd('Search', l:pattern)]
		let l:pattern_accum .= a:text[l:i].'.\{-}'
	endfor
endfunction

function! s:fuzzy_clear()
	if exists('b:fuzzy_matches')
		for l:match in b:fuzzy_matches
			call matchdelete(l:match)
		endfor
		unlet b:fuzzy_matches
	endif
endfunction

function! s:fuzzy_cancel()
	call s:fuzzy_clear()
	nunmap n
	nunmap N
	nunmap <Esc>
endfunction

function! s:fuzzy_n(type, text)
	call s:fuzzy_clear()
	silent! execute 'normal! '.a:type
	if @/ !=# b:fuzzy_last
		call s:fuzzy_cancel()
	else
		call s:fuzzy_hl(a:text)
		echo '~'.(a:type ==# 'n' ? '/' : '?').a:text
	endif
endfunction

nnoremap z/ :<C-U>call <SID>fuzzy(input('~/'))<CR>
