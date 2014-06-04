""" General preferences
filetype off                   " Temporarily disable filetype plugin (required by Vundle)
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

""" Include bundles with Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Navigation plugins
Plugin 'aaronjensen/ctrlp.vim'
Plugin 'qstrahl/vim-matchmaker'
Plugin 'scrooloose/nerdtree'
Plugin 'tommcdo/vim-centaur'
Plugin 'tommcdo/vim-kangaroo'
Plugin 'tpope/vim-unimpaired'

" Editing plugins
Plugin 'AndrewRadev/switch.vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'chrisbra/NrrwRgn'
Plugin 'qstrahl/vim-dentures'
Plugin 'tommcdo/vim-exchange'
Plugin 'tommcdo/vim-express'
Plugin 'tommcdo/vim-lion'
Plugin 'tommcdo/vim-ninja-feet'
Plugin 'tommcdo/vim-nowchangethat'
Plugin 'tommcdo/vim-text-objects'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'

" Tooling plugins
Plugin 'AndrewRadev/writable_search.vim'
Plugin 'SirVer/ultisnips'
Plugin 'joonty/vdebug'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mhinz/vim-tmuxify'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tommcdo/vim-fugitive'
Plugin 'tommcdo/vim-fugitive-blame-ext'
Plugin 'tommcdo/vim-kato'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-projectionist'

" Syntax and colorscheme plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'groenewege/vim-less'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lepture/vim-jinja'

" Documentation plugins
Plugin 'mudpile45/vim-phpdoc'

" Miscellaneous plugins
Plugin 'tommcdo/vim-arsey'

call vundle#end()

filetype plugin on
syntax enable

" Run all config files
runtime! config/*.vim
