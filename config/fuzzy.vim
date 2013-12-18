""" Fuzzy search

function! Fuzzy(text)
	let text = '\c'.substitute(a:text, '.\zs', '.\\{-}', 'g')[:-6]
	call search(text)
	let @/ = text
endfunction

command! -nargs=* Fuzzy call Fuzzy('<args>')
nnoremap z/ :<C-U>Fuzzy 
