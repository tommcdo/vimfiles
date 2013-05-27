""" General preferences
syntax on                      " Enable syntax highlighting
colorscheme default            " Use the default color scheme
set term=xterm-256color        " Enable 256 terminal colors
set background=dark            " Use colorscheme for dark backgrounds
set tabstop=4                  " Use a width of 4 for tabs
set shiftwidth=4               " Use a width of 4 when indenting
set list                       " Place cursor at start of space a tab character occupies
set listchars=tab:\ \          " Display tabs with a space followed by more spaces
set autoindent                 " Automatically preserve indentation level
set nohlsearch                 " Do not highlight matched search terms
set textwidth=0                " Disable all automatic text formatting
set backspace=indent,eol,start " Allow backspace to work over indentation, end of line, and start of insert
set splitright                 " Open vertical splits to the right of current window
set splitbelow                 " Open horizontal splits below current window
set tags=./tags;               " Look for tags file starting in this directory, and traversing upwards to parents
set showtabline=2              " Show tab line even when only one tab is open
set modeline                   " Enable modeline configuration
set noequalalways              " Prevent Vim from equal-sizing windows after closing splits
set copyindent                 " Copy indentation whitespace from previous line
set preserveindent             " Try to preserve indentation when shifting

""" Mappings for window management
map g. <C-W>_<C-W><Bar>
map gj <C-W>j<C-W>_
map gk <C-W>k<C-W>_

""" NERDTree maps and settings
nmap <F7> :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>
let NERDTreeDirArrows = 0 " Use plain old ASCII instead of fancy arrows

""" Fugitive maps and settings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>ge :Gedit<CR>
nmap <Leader>gb :Gblame<CR>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P " Enable Fugitive statusline (adds branch name)

""" Gundo maps and settings
nmap <F5> :GundoToggle<CR>
let g:gundo_right = 1

""" GitGutter maps and settings
let g:gitgutter_eager = 0

""" Pathogen
call pathogen#infect() " Start Pathogen

""" Solarized color scheme settings
let g:solarized_contrast = 'high'
colorscheme solarized

""" Additional tweaks
" Refresh GitGutter when committing with Fugitive
autocmd User Fugitive execute 'autocmd BufWrite ' . fugitive#extract_git_dir('.') . '/COMMIT_EDITMSG :GitGutterAll'
