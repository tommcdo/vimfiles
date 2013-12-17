""" Fuzzy seach

function! Fuzzy(text)
	let text = substitute(a:text, '.\zs', '.*', 'g')[:-3]
	call search(text)
	let @/ = text
endfunction

command! -nargs=* Fuzzy call Fuzzy('<args>')
nnoremap <Leader>/ :<C-U>Fuzzy 
