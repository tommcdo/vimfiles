" Use the silver searcher (ag) for :grep if it is available
if executable('ag')
	set grepprg=ag\ --column
" Or use ack
elseif executable('ack')
	set grepprg=ack\ --column
endif
