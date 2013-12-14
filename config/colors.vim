""" Colorscheme settings
function! ColorScheme(cs)
	if a:cs == 'solarized'
		set background=dark
		let g:solarized_termcolors = 256
		colorscheme solarized
		highlight clear SpecialKey
		highlight link SpecialKey Identifier
	elseif a:cs == 'seoul256'
		let g:seoul256_background = 233
		colorscheme seoul256
	else
		exec 'colorscheme '.a:cs
	endif
endfunction
command! -nargs=1 -complete=color ColorScheme call ColorScheme('<args>')
ColorScheme solarized
