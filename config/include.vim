let s:filetype_expressions = {}

function! include#expression(fname)
	return substitute(a:fname, '^/', '', '')
endfunction

function! include#register(filetype, fcn)
	let s:filetype_expressions[a:filetype] = a:fcn
endfunction

set includeexpr=include#expression(v:fname)
