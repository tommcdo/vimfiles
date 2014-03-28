" Use the silver searcher (ag) for :grep if it is available
if executable('ag')
	set grepprg=ag\ --column\ --nogroup\ --nocolor
	set grepformat=%f:%l:%c:%m
" Or use ack
elseif executable('ack')
	set grepprg=ack\ --column\ --nogroup\ --nocolor
	set grepformat=%f:%l:%c:%m
endif
