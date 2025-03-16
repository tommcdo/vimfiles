""" Fugitive maps and settings

" Standard maps
nnoremap <Leader>gs :belowright Git<CR>
nnoremap <Leader>gd :Gvdiffsplit<CR>
nnoremap <Leader>gl :Gclog<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gb :Git blame -w -M<CR>
nnoremap <Leader>gg :Git log --graph --all --decorate<CR>

" Force fugitive to use :! instead of :terminal (for neovim)
let g:fugitive_force_bang_command = 1

" 'Input pending' maps (start Ex command without <CR>)
nnoremap <Leader>gt :Gtabedit! 

" Delete fugitive buffers when they become hidden
augroup FugitiveDeleteBuffers
	autocmd!
	autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Open a :Gblame window with commit for current line highlighted
function! s:expose(args)
	execute 'Git blame' a:args
	normal C
	execute 'match Search /^'.expand('<cword>').'/'
	wincmd p
endfunction
command! -nargs=* GExpose silent! call s:expose(<q-args>)
nnoremap <Leader>gx :GExpose -w -M<CR>

" Enable automatic fold opening/closing for commit buffers
function! s:fold_openclose_on()
	let s:foldopen = &foldopen
	let s:foldclose = &foldclose
	set foldopen=all
	set foldclose=all
endfunction
function! s:fold_openclose_off()
	let &foldopen = s:foldopen
	let &foldclose = s:foldclose
endfunction
augroup FugitiveFoldSettings
	autocmd!
	autocmd BufEnter fugitive://*//[0-9a-f]\\\{7,48\} call s:fold_openclose_on()
	autocmd BufLeave fugitive://*//[0-9a-f]\\\{7,48\} call s:fold_openclose_off()
augroup END

" Create a :Grange command to populate the quickfix list with a range of commits
let s:log_messages = {}
function! s:log_message(commit) " Stolen from https://github.com/tommcdo/vim-fugitive-blame-ext
	if a:commit =~ '^0\+$'
		return '(Not Committed Yet)'
	endif
	if !has_key(s:log_messages, a:commit)
		let cmd_output = system('git --git-dir='.b:git_dir.' show --oneline '.a:commit)
		let first_line = split(cmd_output, '\n')[0]
		let s:log_messages[a:commit] = substitute(first_line, '[a-z0-9]\+ ', '', '')
	endif
	return s:log_messages[a:commit]
endfunction
function! s:edit_commit_range(range_spec)
	let git_dir = fugitive#extract_git_dir('.')
	let commits = systemlist('git rev-list ' . a:range_spec)
	call setqflist(map(commits, '{"filename": "fugitive://" . git_dir . "//" . v:val, "text": s:log_message(v:val)}'))
endfunction
command! -nargs=1 Grange call s:edit_commit_range(<q-args>)
