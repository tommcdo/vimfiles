set statusline=%!MyStatusLine()

let s:active_bg      = 233
let s:active_fg      = 242
let s:inactive_bg    = 237
let s:inactive_fg    = 242

let s:filename = s:create_group(s:active_bg, 6, 'bold')
let s:branch   = s:create_group(s:active_bg, 178, 'bold')
let s:green    = s:create_group(s:active_bg, 70, 'bold')
let s:red      = s:create_group(s:active_bg, 88, 'bold')

call s:define('StatusLine', s:active_bg, s:active_fg, 'bold')
call s:define('StatusLineNC', s:inactive_bg, s:inactive_fg, 'none')

function! MyStatusLine()
	let l:s = ''
	let l:s .= '%<'
	let l:s .= s:hi('%f', s:filename)
	let l:s .= ' %h'
	let l:s .= s:hi('%{&readonly?"*":""}', s:red)
	let l:s .= ' '
	let l:s .= s:hi('%{fugitive#statusline()}', s:branch)
	let l:s .= ' '
	let l:s .= s:hi('%{&modified?"✗":""}', 3)
	let l:s .= s:hi('%{(&modifiable&&!&modified)?"✓":""}', s:green)
	let l:s .= '%='
	let l:s .= '%-14.(%l,%c%V%) '
	let l:s .= '%P'
	return l:s
endfunction

let s:group_number = 1
function! s:create_group(background, foreground, term)
	let group_number = s:group_number
	call s:define('User'.group_number, a:background, a:foreground, a:term)
	let s:group_number += 1
	return group_number
endfunction

function! s:define(group, background, foreground, term)
	execute 'highlight '.a:group.' cterm='.a:term.' ctermbg='.a:background.' ctermfg='.a:foreground
endfunction

function! s:hi(term, color)
	return '%'.a:color.'*'.a:term.'%*'
endfunction
