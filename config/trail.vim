function! TrailingWhitespaceToggle(...)
	let hlgroup = a:0 ? a:0 : 'Search'
	if !exists('w:trailing_whitespace_match')
		let w:trailing_whitespace_match = matchadd(hlgroup, '\s\+$')
		echo 'Trailing whitespace on'
	else
		call matchdelete(w:trailing_whitespace_match)
		unlet w:trailing_whitespace_match
		echo 'Trailing whitespace off'
	endif
endfunction
nnoremap yot :<C-u>call TrailingWhitespaceToggle()<CR>
