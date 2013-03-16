"set expandtab
set list lcs=tab:\ \ 
set tabstop=4
set shiftwidth=4
syntax on
set background=dark
set autoindent
set nohlsearch
set textwidth=0
set formatoptions=tcq
set formatoptions-=l
set backspace=2

" window management
map g. <C-W>_<C-W>\|
map gj <C-W>j<C-W>_
map gk <C-W>k<C-W>_
set splitright
set splitbelow
set switchbuf=usetab

au BufNewFile,BufRead *.tpl set ft=php

" ctags stuff
set tags=./tags;

" NERDTree maps
nmap <F7> :NERDTreeToggle<CR>
nmap <Leader>nm :NERDTreeMirror<CR>
nmap <Leader>nf :NERDTreeFind<CR>

" fugitive maps
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>ge :Gedit<CR>

" Start Pathogen
call pathogen#infect()
