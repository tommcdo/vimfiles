function! s:reset_indent(level)
	let level = a:level ? a:level : '4'
	execute "set noexpandtab"
	execute "set tabstop=".level
	execute "set softtabstop=".level
	execute "set shiftwidth=".level
endfunction

command! -nargs=* ResetIndent call <SID>reset_indent(<q-args>)
