function! s:edit_conf_file(name)
	execute 'tabedit ~/.vim/config/'.a:name.'.vim'
endfunction

function! s:conf_complete(A, L, P)
	let arg_to_cursor = strpart(a:L, 11, a:P)
	let space_idx = stridx(arg_to_cursor, ' ')
	if space_idx == -1
		return filter(map(glob('~/.vim/config/*.vim', 0, 1), 'fnamemodify(v:val, ":t:r")'), 'v:val =~ "^".a:A.".*"')
	else
		return []
	endif
endfunction

command! -nargs=1 -complete=customlist,s:conf_complete VimConf call s:edit_conf_file(<q-args>)
