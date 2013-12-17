""" Fuzzy search

function! Fuzzy(text)
	let text = '\c.*\zs'.substitute(a:text, '.\zs', '.\\{-}', 'g')[:-6]
	call search(text)
	let @/ = text
endfunction

command! -nargs=* Fuzzy call Fuzzy('<args>')
nnoremap <Leader>/ :<C-U>Fuzzy 
