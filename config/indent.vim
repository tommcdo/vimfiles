function! s:reset_indent(level)
	let level = a:level ? a:level : '4'
	execute "set noexpandtab"
	execute "set tabstop=".level
	execute "set softtabstop=".level
	execute "set shiftwidth=".level
endfunction

command! -nargs=* ResetIndent call <SID>reset_indent(<q-args>)

function! s:obliterate()
	set autoindent nocindent indentexpr= nosmartindent
endfunction
augroup DisableAllIndent
	autocmd!
	autocmd BufEnter * call s:obliterate()
augroup END

function! s:fix_indentation(line1, line2, level)
	let level = str2nr(a:level ? a:level : '4')
	let pattern = '^\( \{' . level . '}\)\+ \{1,' . (level - 1) . '}\ze\S'
	execute a:line1 . ',' . a:line2 . 's#' . pattern . '#\=repeat(" ", ' . level . ' * float2nr(round(len(submatch(0)) / ' . level . '.0)))#'
endfunction

command! -range=% -nargs=? FixIndent call <SID>fix_indentation(<line1>, <line2>, <q-args>)
