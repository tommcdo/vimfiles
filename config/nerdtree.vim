""" NERDTree maps and settings
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
let NERDTreeDirArrows = 0 " Use plain old ASCII instead of fancy arrows

try
	let NERDTreeIgnore = systemlist('git check-ignore *')
endtry
