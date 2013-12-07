""" General preferences
syntax on                      " Enable syntax highlighting
set term=xterm-256color        " Enable 256 terminal colors
set background=dark            " Use colorscheme for dark backgrounds
set tabstop=4                  " Use a width of 4 for tabs
set softtabstop=4              " Use a width of 4 when inserting tabs
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
set laststatus=2               " Show statusline even when there is only one window
set winwidth=9                 " Allow current window to be as small as 9 columns wide
set incsearch                  " Show search patterns as they are typed

""" Include bundles with Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-abolish'
Bundle 'tommcdo/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tommcdo/vim-text-objects'
Bundle 'tommcdo/vim-lion'
Bundle 'tommcdo/vim-centaur'
Bundle 'tommcdo/vim-kangaroo'
Bundle 'tommcdo/vim-arsey'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'sjl/gundo.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'lepture/vim-jinja'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'qstrahl/vim-matchmaker'
Bundle 'junegunn/seoul256.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tommcdo/vim-fugitive-blame-ext'
Bundle 'rking/ag.vim'
Bundle 'aaronjensen/ctrlp.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tommcdo/vim-exchange'

""" Mappings for window management
nnoremap g. <C-W>_<C-W><Bar>
nnoremap gj <C-W>j<C-W>_
nnoremap gk <C-W>k<C-W>_

""" Custom commands that don't yet warrant a plugin
command! -range=% Haste <line1>,<line2>w !haste | xclip

""" CtrlP maps and settings
let g:ctrlp_map = '<C-P>'

""" NERDTree maps and settings
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
let NERDTreeDirArrows = 0 " Use plain old ASCII instead of fancy arrows

""" Syntastic maps and settings
nnoremap <F6> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1 " Always populate location list on errors

""" Fugitive maps and settings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gb :Gblame -w<CR>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P " Enable Fugitive statusline (adds branch name)
autocmd BufReadPost fugitive://* set bufhidden=delete

""" Gundo maps and settings
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1

""" Gist maps and settings
let g:gist_clip_command = 'xclip'

""" Matchmaker maps and settings
nnoremap <F8> :MatchmakerToggle<CR>

""" Colorscheme settings
function! ColorScheme(cs)
	if a:cs == 'solarized'
		set background=dark
		let g:solarized_termcolors = 256
		colorscheme solarized
		highlight clear SpecialKey
		highlight link SpecialKey Identifier
	elseif a:cs == 'seoul256'
		let g:seoul256_background = 233
		colorscheme seoul256
	else
		exec 'colorscheme '.a:cs
	endif
endfunction
command! -nargs=1 -complete=color ColorScheme call ColorScheme('<args>')
ColorScheme solarized

function! TrailingWhitespaceToggle(...)
	let hlgroup = a:0 ? a:0 : 'Search'
	if !exists('s:trailing_whitespace_match')
		let s:trailing_whitespace_match = matchadd(hlgroup, '\s\+$')
		echo 'Trailing whitespace on'
	else
		call matchdelete(s:trailing_whitespace_match)
		unlet s:trailing_whitespace_match
		echo 'Trailing whitespace off'
	endif
endfunction
nnoremap <F9> :<C-u>call TrailingWhitespaceToggle()<CR>
