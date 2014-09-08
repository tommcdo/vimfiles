let s:scroll_speed = 10

function! s:set_scroll_speed(speed)
	let s:scroll_speed = max([1, a:speed])
endfunction

function! s:scroll(direction)
	return s:scroll_speed.a:direction
endfunction

command! -nargs=1 ScrollSpeed call s:set_scroll_speed(<args>)
command! -nargs=1 ScrollSpeedAdjust call s:set_scroll_speed(s:scroll_speed + <args>)

nnoremap <expr> <Plug>(scroll-up) <SID>scroll('k')
nnoremap <expr> <Plug>(scroll-down) <SID>scroll('j')

nmap <Up> <Plug>(scroll-up)
nmap <Down> <Plug>(scroll-down)
