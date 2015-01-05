let g:elephant_map = {
	\ 'f': function('elephant#current_file'),
	\ 'p': function('elephant#vcs_project')
\ }

function! elephant#prompt(base)
	let l:Fcn = get(g:elephant_map, a:base, function('elephant#identity'))
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
