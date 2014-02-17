""" Mappings for window management

" Move to and maximize windows
nnoremap g. <C-W>_<C-W><Bar>
nnoremap gj <C-W>j<C-W>_
nnoremap gk <C-W>k<C-W>_

" Resize windows
nnoremap <expr> <Up> tabpagewinnr(tabpagenr(), '$') > 1 ? '<C-W>+' : ''
nnoremap <expr> <Down> tabpagewinnr(tabpagenr(), '$') > 1 ? '<C-W>-' : ''
nnoremap <Right> <C-W>>
nnoremap <Left> <C-W><
