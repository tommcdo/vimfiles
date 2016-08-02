let g:elephant_map = {
	\ 'f': 'elephant#current_file',
	\ 'p': 'elephant#vcs_project'
\ }

function! elephant#prompt(base)
	let l:base = tolower(a:base)
	let l:Fcn = function(get(g:elephant_map, l:base, 'elephant#identity'))
	let l:basedir = l:Fcn()
	execute 'lcd' l:basedir
	let l:file = fnamemodify(input(l:basedir.'/', '', 'file'), ':p')
	lcd -
	return fnamemodify(l:file, ':.')
endfunction

function! s:elephant_init()
	let l:base = getchar()
	return elephant#prompt(nr2char(l:base))
endfunction

function! elephant#identity()
	return '.'
endfunction

function! elephant#vcs_project()
	return fnamemodify(finddir('.git', '.;'), ':h')
endfunction

function! elephant#current_file()
	return expand('%:h')
endfunction

inoremap <silent> <expr> <C-R><C-E> <SID>elephant_init()
cnoremap <silent> <C-R><C-E> <C-R>=<SID>elephant_init()<CR>
