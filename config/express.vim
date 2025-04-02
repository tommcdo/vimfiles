let s:mapped = 0
function! s:map_expr_once()
	if !s:mapped
		MapExpress c= eval
		let s:mapped = 1
	endif
endfunction

if v:vim_did_enter
	call s:map_expr_once()
else
	autocmd VimEnter * call s:map_expr_once()
endif
