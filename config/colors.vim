""" Colorscheme settings
function! ColorScheme(cs)
	if a:cs == 'flattened_dark'
		set background=dark
		let g:solarized_termcolors = 256
		colorscheme flattened_dark
		highlight clear SpecialKey
		highlight link SpecialKey Identifier
	else
		exec 'colorscheme '.a:cs
	endif
endfunction
command! -nargs=1 -complete=color ColorScheme call ColorScheme(<q-args>)
ColorScheme flattened_dark
