" a text object for a method (suitable for Java)
function! s:MethodTextObject(type)
	if a:type == 'i'
		execute 'silent! normal! $]MV[m'
	else
		execute 'silent! normal! $]mkV[m'
	endif
	silent! call repeat#set("\<Plug>(method-text-object-".a:type.")")
endfunction

onoremap <silent> <script> <Plug>(method-text-object-i) :<C-U>call <SID>MethodTextObject("i")<CR>
onoremap <silent> <script> <Plug>(method-text-object-a) :<C-U>call <SID>MethodTextObject("a")<CR>

omap im <Plug>(method-text-object-i)
omap am <Plug>(method-text-object-a)
