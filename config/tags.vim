function! s:tags()
	let path = expand('%:p:h').';'
	let tag_script = findfile('ctags.sh', path)
	if executable(tag_script)
		execute '!(cd '.fnamemodify(tag_script, ':h').'; ./'.fnamemodify(tag_script, ':t').') &'
	endif
endfunction

command! Tags call s:tags()
