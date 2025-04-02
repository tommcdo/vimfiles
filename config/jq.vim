function! s:jq(args)
	let l:jq_command = 'jq ' . shellescape(a:args)
	let l:stdin = join(getline(1, '$'), "\n")
	let l:output = system(l:jq_command, l:stdin)
	tabnew
	set ft=json
	put! =l:output
	0
endfunction

command! -nargs=* Jq call s:jq(<q-args>)
