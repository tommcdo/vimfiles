highlight clear TabLineSel
highlight link TabLineSel User1
highlight clear TabLine
highlight link TabLine StatusLineNC
highlight clear TabLineFill
highlight link TabLineFill StatusLineNC

function! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		let numwin = tabpagewinnr(i + 1, '$')
		if numwin > 1
			let s .= ' ' . numwin
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by MyTabLabel()
		let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999Xclose'
	endif

	return s
endfunction

function! MyTabLabel(n)
	let title = gettabvar(a:n, 'tab_title')
	if title != ''
		return title
	else
		let buflist = tabpagebuflist(a:n)
		let winnr = tabpagewinnr(a:n)
		let bufname = bufname(buflist[winnr - 1])
		if bufname == ''
			return '[No Name]'
		else
			return pathshorten(bufname)
		endif
	endif
endfunction

function! s:set_title(title, bang)
	if a:bang
		unlet! t:tab_title
	else
		let t:tab_title = a:title
		redraw!
	endif
endfunction

command! -bang -nargs=* SetTitle call s:set_title("<args>", "<bang>")

set tabline=%!MyTabLine()
