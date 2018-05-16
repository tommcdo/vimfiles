if !exists('w:tag_stack_index')
	let w:tag_stack_index = 0
endif

function! s:java_search_context(default, edit_command)
	return exists('g:EclimDisabled') ? s:default : ":\<C-U>let w:tag_stack_index += 1\<CR>:KangarooPush\<CR>:JavaSearchContext -a ".a:edit_command."\<CR>"
endfunction

function! s:java_search_pop()
	return (!exists('g:EclimDisabled') && w:tag_stack_index > 0) ? ":\<C-U>let w:tag_stack_index -= 1\<CR>:KangarooPop\<CR>" : "\<C-T>"
endfunction

nnoremap <silent> <buffer> <expr> <C-]> <SID>java_search_context('<C-]>', 'edit')
nnoremap <silent> <buffer> <expr> <C-W>] <SID>java_search_context('<C-W>]', 'split')

nnoremap <silent> <buffer> <expr> <C-T> <SID>java_search_pop()

if !exists('g:unite_source_menu_menus')
	let g:unite_source_menu_menus = {}
endif
let g:unite_source_menu_menus.java = {
	\ 'description': 'Java'
\ }
let g:unite_source_menu_menus.java.command_candidates = {
	\ 'Find Problems': 'ProjectProblems!',
	\ 'Organize Imports': 'JavaImportOrganize',
	\ 'Refresh Project': 'ProjectRefresh',
	\ 'Find Usages': 'JavaSearchContext -t all -x references',
	\ 'Find Implementations': 'JavaSearchContext -t classOrInterface -x implementors',
	\ 'Show Call Hierarchy': 'JavaCallHierarchy',
	\ 'Show JavaDoc': 'JavaDocPreview',
	\ 'Refactor: Rename': 'execute "JavaRename" input("New name: ", expand("<cword>"))'
\ }
nnoremap <buffer> <C-J> :<C-U>Unite -here -smartcase -start-insert -direction=botright menu:java<CR>
