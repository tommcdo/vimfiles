" Insert base filename (no path, no extension)
inoremap <expr> <C-R><Space> expand('%:t:r')
cnoremap <expr> <C-R><Space> expand('%:t:r')

" Switch to alternate file
nnoremap <Space> <C-^>

" Close the preview window
nnoremap <BS> <C-W>z

function! s:custom_gf()
	let l:file = expand('<cfile>')
	try
		execute 'find' l:file
	catch /E345/
		execute 'find' substitute(l:file, '^/', '', '')
	endtry
endfunction
nnoremap <silent> gf :<C-U>call <SID>custom_gf()<CR>

function! s:insert_shell_command(joiner)
	let l:command = input('!', '', 'shellcmd')
	if len(l:command) > 0
		return join(systemlist(l:command), a:joiner)
	else
		return ''
	endif
endfunction
inoremap <expr> <C-R>! <SID>insert_shell_command("\n")
cnoremap <expr> <C-R>! <SID>insert_shell_command(" ")
