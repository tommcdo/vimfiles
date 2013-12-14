function! TrailingWhitespaceToggle(...)
	let hlgroup = a:0 ? a:0 : 'Search'
	if !exists('s:trailing_whitespace_match')
		let s:trailing_whitespace_match = matchadd(hlgroup, '\s\+$')
		echo 'Trailing whitespace on'
	else
		call matchdelete(s:trailing_whitespace_match)
		unlet s:trailing_whitespace_match
		echo 'Trailing whitespace off'
	endif
endfunction
nnoremap <F9> :<C-u>call TrailingWhitespaceToggle()<CR>
