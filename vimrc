""" General preferences
syntax on                      " Enable syntax highlighting
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

""" Custom commands that don't yet warrant a plugin
command! -range=% Haste <line1>,<line2>w !haste | xclip

""" NERDTree maps and settings
nmap <F7> :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>
let NERDTreeDirArrows = 0 " Use plain old ASCII instead of fancy arrows

""" Syntastic maps and settings
nmap <F6> :SyntasticToggleMode<CR>

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

""" Gist maps and settings
let g:gist_clip_command = 'xclip'

""" Matchmaker maps and settings
nmap <F8> :MatchmakerToggle<CR>

""" Pathogen
call pathogen#infect() " Start Pathogen

""" Colorscheme settings
"let g:seoul256_background = 233
"colorscheme seoul256

""" Colorscheme settings
let g:solarized_termcolors = 256
colorscheme solarized
hi clear SpecialKey
hi SpecialKey ctermfg=33 guifg=#40ffff
