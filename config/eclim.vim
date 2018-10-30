let g:EclimQuickFixOpen = 0
let g:EclimQuickFixHeight = 4
let g:EclimShowQuickfixSigns = 0
let g:EclimShowLoclistSigns = 0
let g:EclimShowCurrentError = 0
let g:EclimShowCurrentErrorBalloon = 0
let g:EclimLoggingDisabled = 1
let g:EclimJavaCallHierarchyDefaultAction = 'edit'

function! s:git_status_open()
	let buffers_in_tab = tabpagebuflist()
	for buffer_number in buffers_in_tab
		if bufname(buffer_number) =~ '\.git/index$'
			return 1
		endif
	endfor
	return 0
endfunction
function! s:close_preview_window()
	if !s:git_status_open()
		pclose
	endif
endfunction
augroup ClosePreviewWindow
	autocmd!
	autocmd InsertLeave *.java call s:close_preview_window()
augroup END
