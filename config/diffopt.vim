" Provide a function to toggle iwhite (ignore whitespace)
function! s:toggle_iwhite(opt)
	if a:opt == -1 || (a:opt == 0 && &diffopt =~ 'iwhite')
		echo ':set diffopt-=iwhite'
		set diffopt-=iwhite
	elseif a:opt == 1 || (a:opt == 0 && &diffopt !~ 'iwhite')
		echo ':set diffopt+=iwhite'
		set diffopt+=iwhite
	endif
endfunction

" Add mappings for toggling and setting iwhite (in the style of unimpaired.vim)
nnoremap coD :call <SID>toggle_iwhite(0)<CR>
nnoremap [oD :call <SID>toggle_iwhite(1)<CR>
nnoremap ]oD :call <SID>toggle_iwhite(-1)<CR>
