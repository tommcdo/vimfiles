function! s:edit_current_syntax(create)
	let l:syntax_file = $HOME.'/.vim/syntax/'.&filetype.'.vim'
	if filereadable(l:syntax_file) || a:create
		execute 'tabedit' l:syntax_file
	else
		echo 'No custom syntax file for' &filetype '(Use ! to create)'
	endif
endfunction

command! -bang EditSyntax call s:edit_current_syntax(<bang>0)
