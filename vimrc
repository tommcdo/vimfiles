""" General preferences
filetype plugin on             " Enable loading of plugins for specific filetypes
set term=xterm-256color        " Enable 256 terminal colors
set t_ut=                      " Do not use current background color to clear
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
set fillchars=vert:\|,fold:\   " Use space to fill folded text lines
set hidden                     " Allow modified buffers to become hidden
set path=**                    " Look for files anywhere in the current directory
set directory=~/.vim/swap//    " Put swap files in a different directory
set nofixendofline             " Don't automatically add an EOL to last line on save

if v:version >= 704 && has('patch338')
	set breakindent                " Wrap lines, taking indentation into account
	set showbreak=›                " Place a line break indicator on wrapped lines
end

let g:plug_threads = 1

call plug#begin('~/.vim/plugged')

" Navigation plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'qstrahl/vim-matchmaker'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-centaur'
Plug 'tommcdo/vim-kangaroo'
Plug 'tommcdo/vim-lister'
Plug 'tpope/vim-unimpaired'

" Editing plugins
Plug 'PeterRincker/vim-argumentative'
Plug 'chrisbra/NrrwRgn'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'qstrahl/vim-dentures'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-express'
Plug 'tommcdo/vim-lion'
Plug 'tommcdo/vim-ninja-feet'
Plug 'tommcdo/vim-nowchangethat'
Plug 'tommcdo/vim-text-objects'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

" Tooling plugins
Plug 'AndrewRadev/writable_search.vim'
Plug 'joonty/vdebug'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-tmuxify'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'sjl/gundo.vim'
Plug 'tommcdo/vim-fubitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tommcdo/vim-kato'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'

" Syntax and colorscheme plugins
Plug 'groenewege/vim-less'
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'lepture/vim-jinja'
Plug 'romainl/flattened', { 'branch' : '6cd6f45' }

" Miscellaneous plugins
Plug 'kana/vim-submode'
Plug 'tommcdo/vim-arsey'

call plug#end()
filetype indent off

" Manually add eclim directory to runtime path
set runtimepath+=~/.vim/bundle

syntax enable

" Run all config files
runtime! config/*.vim
