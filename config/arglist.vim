" Make a local copy of the arglist
nnoremap <Leader>al :arglocal<CR>

" Add current buffer to arglist
nnoremap <Leader>aa :argadd %<CR>

" Start a new local arglist with current buffer
nnoremap <Leader>as :arglocal! %<CR>

" Delete current buffer from arglist
nnoremap <Leader>ad :<C-R>=argidx()+1<CR>argdelete<CR>

" Jump to the current file in the arglist
nnoremap <Leader>ac :argument<CR>

" Add file under cursor to arglist in previous window (useful in :Gstatus window)
nnoremap <Leader>af :wincmd p <Bar> argadd <C-R><C-F> <Bar> wincmd p<CR>

" Start a new local arglist in previous window with file under cursor (useful in :Gstatus window)
nnoremap <Leader>aF :wincmd p <Bar> arglocal! <C-R><C-F> <Bar> wincmd p<CR>

" Re-map unimpaired.vim's [a and ]a for cyclic arglist movement
nnoremap ]a :<C-R>=(argidx() + 1) % argc() + 1<CR>argument<CR>
nnoremap [a :<C-R>=(argc() + argidx() - 1) % argc() + 1<CR>argument<CR>
