function! s:project_register()
	 let l:basedir = fnamemodify(finddir('.git', '.;'), ':h')
	execute 'lcd' l:basedir
	let l:file = fnamemodify(input(l:basedir.'/', '', 'file'), ':p')
	lcd -
	return fnamemodify(l:file, ':.')
endfunction
inoremap <expr> <C-R>, <SID>project_register()
cnoremap <C-R>, <C-R>=<SID>project_register()<CR>
