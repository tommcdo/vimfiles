""" General preferences

" Display cursor at leftmost column of Tab characters (don't fully understand)
set list lcs=tab:\ \ 

" Use a width of 4 for tabs
set tabstop=4

" Use a width of 4 when indenting
set shiftwidth=4

" Enable syntax highlighting
syntax on

" Use colorscheme for dark backgrounds
set background=dark

" Automatically preserve indentation level
set autoindent

" Do not highlight matched search terms
set nohlsearch

" Disable all automatic text formatting
set textwidth=0

" Allow backspace to work over indentation, end of line, and start of insert
set backspace=indent,eol,start


""" Mappings for window management

" Maximize current window
map g. <C-W>_<C-W>\|

" Move to window below and maximize vertically
map gj <C-W>j<C-W>_

" Move to window above and maximize vertically
map gk <C-W>k<C-W>_

" Cause vertical splits to open to right
set splitright

" Cause horizontal splits to open below
set splitbelow


""" Settings for ctags

" Look for ctags file starting in this directory, and traversing upwards to parents
set tags=./tags;


""" NERDTree maps and settings

" Open and close NERDTree
nmap <F7> :NERDTreeToggle<CR>

" Find current file in NERDTree
nmap <Leader>nf :NERDTreeFind<CR>

" Use plain old ASCII instead of fancy arrows
let NERDTreeDirArrows=0


""" Fugitive maps and settings

" Show git status
nmap <Leader>gs :Gstatus<CR>

" Show a git diff on the current file
nmap <Leader>gd :Gdiff<CR>

" Load revisions of current file in quickfix list
nmap <Leader>gl :Glog<CR>

" Return to working copy of current revision
nmap <Leader>ge :Gedit<CR>

" Show git blame
nmap <Leader>gb :Gblame<CR>

" Enable Fugitive statusline (adds branch name)
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


""" Pathogen

" Start Pathogen
call pathogen#infect()
