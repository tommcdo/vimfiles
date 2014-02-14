" Use the silver searcher (ag) for :grep if it is available
if executable('ag')
	set grepprg=ag\ --column
endif
