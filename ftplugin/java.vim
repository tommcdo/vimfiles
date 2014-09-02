function! s:java_search_context(default, edit_command)
	return exists('g:EclimDisabled') ? a:default : ":\<C-U>JavaSearchContext -a ".a:edit_command."\<CR>"
endfunction

nnoremap <silent> <buffer> <expr> <C-]> <SID>java_search_context('<C-]>', 'edit')
nnoremap <silent> <buffer> <expr> <C-W>] <SID>java_search_context('<C-W>]', 'split')
