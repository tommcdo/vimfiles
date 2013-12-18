""" General preferences
syntax on                      " Enable syntax highlighting
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

""" Include bundles with Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Navigation plugins
Bundle 'aaronjensen/ctrlp.vim'
Bundle 'deris/columnjump'
Bundle 'qstrahl/vim-matchmaker'
Bundle 'scrooloose/nerdtree'
Bundle 'tommcdo/vim-centaur'
Bundle 'tommcdo/vim-kangaroo'
Bundle 'tpope/vim-unimpaired'

" Editing plugins
Bundle 'PeterRincker/vim-argumentative'
Bundle 'chrisbra/NrrwRgn'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tommcdo/vim-exchange'
Bundle 'tommcdo/vim-lion'
Bundle 'tommcdo/vim-text-objects'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" Tooling plugins
Bundle 'joonty/vdebug'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tommcdo/vim-fugitive'
Bundle 'tommcdo/vim-fugitive-blame-ext'
Bundle 'tpope/vim-dispatch'

" Syntax and colorscheme plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'junegunn/seoul256.vim'
Bundle 'lepture/vim-jinja'
Bundle 'nanotech/jellybeans.vim'
Bundle 'puppetlabs/puppet-syntax-vim'

" Miscellaneous plugins
Bundle 'tommcdo/vim-arsey'

" Run all config files
runtime! config/*.vim
