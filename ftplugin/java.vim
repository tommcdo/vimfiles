if !exists('g:tag_stack_index')
	let g:tag_stack_index = 0
endif

function! s:java_search_context(default, edit_command)
	return exists('g:EclimDisabled') ? s:default : ":\<C-U>let g:tag_stack_index += 1\<CR>:KangarooPush\<CR>:JavaSearchContext -a ".a:edit_command."\<CR>"
endfunction

function! s:java_search_pop()
	return (!exists('g:EclimDisabled') && g:tag_stack_index > 0) ? ":\<C-U>let g:tag_stack_index -= 1\<CR>:KangarooPop\<CR>" : "\<C-T>"
endfunction

nnoremap <silent> <buffer> <expr> <C-]> <SID>java_search_context('<C-]>', 'edit')
nnoremap <silent> <buffer> <expr> <C-W>] <SID>java_search_context('<C-W>]', 'split')

nnoremap <silent> <buffer> <expr> <C-T> <SID>java_search_pop()
