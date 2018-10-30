""" Colorscheme settings
autocmd ColorSchemePre flattened_dark call s:flattened_dark_pre()
autocmd ColorScheme flattened_dark call s:flattened_dark()

function s:flattened_dark_pre()
	set background=dark
	let g:solarized_termcolors = 256
endfunction

function! s:flattened_dark()
	highlight clear SpecialKey
	highlight link SpecialKey Identifier
endfunction
