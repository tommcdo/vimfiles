let s:active_bg      = 233
let s:inactive_bg    = 237
let s:filename_color = 6
let s:branch_color   = 178

function! s:define(group, background, foreground, ...)
	let cterm = a:0 ? a:1 : 'bold'
	execute 'highlight '.a:group.' cterm='.cterm.' ctermbg='.a:background.' ctermfg='.a:foreground
endfunction

call s:define('StatusLine', s:active_bg, 242)
call s:define('StatusLineNC', s:inactive_bg, 242, 'none')
call s:define('User1', s:active_bg, s:filename_color)
call s:define('User2', s:active_bg, s:branch_color)
call s:define('User3', s:active_bg, 88)
call s:define('User4', s:active_bg, 70)

function! s:hi(term, color)
	return '%'.a:color.'*'.a:term.'%*'
endfunction

function! MyStatusLine()
	let l:s = ''
	let l:s .= '%<'
	let l:s .= s:hi('%f', 1)
	let l:s .= ' %h'
	let l:s .= s:hi('%{&readonly?"*":""}', 3)
	let l:s .= ' '
	let l:s .= s:hi('%{fugitive#statusline()}', 2)
	let l:s .= ' '
	let l:s .= s:hi('%{&modified?"✗":""}', 3)
	let l:s .= s:hi('%{&modified?"":"✓"}', 4)
	let l:s .= '%='
	let l:s .= '%-14.(%l,%c%V%) '
	let l:s .= '%P'
	return l:s
endfunction

set statusline=%!MyStatusLine()
