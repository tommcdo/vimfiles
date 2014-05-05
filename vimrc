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

""" Include bundles with Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Navigation plugins
Bundle 'aaronjensen/ctrlp.vim'
Bundle 'qstrahl/vim-matchmaker'
Bundle 'scrooloose/nerdtree'
Bundle 'tommcdo/vim-centaur'
Bundle 'tommcdo/vim-kangaroo'
Bundle 'tpope/vim-unimpaired'

" Editing plugins
Bundle 'AndrewRadev/switch.vim'
Bundle 'PeterRincker/vim-argumentative'
Bundle 'chrisbra/NrrwRgn'
Bundle 'qstrahl/vim-dentures'
Bundle 'tommcdo/vim-exchange'
Bundle 'tommcdo/vim-express'
Bundle 'tommcdo/vim-lion'
Bundle 'tommcdo/vim-ninja-feet'
Bundle 'tommcdo/vim-text-objects'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'

" Tooling plugins
Bundle 'AndrewRadev/writable_search.vim'
Bundle 'joonty/vdebug'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mhinz/vim-tmuxify'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tommcdo/vim-kato'
Bundle 'tommcdo/vim-fugitive'
Bundle 'tommcdo/vim-fugitive-blame-ext'
Bundle 'tpope/vim-projectionist'
Bundle 'wakatime/vim-wakatime'

" Syntax and colorscheme plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'groenewege/vim-less'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'lepture/vim-jinja'

" Documentation plugins
Bundle 'mudpile45/vim-phpdoc'

" Miscellaneous plugins
Bundle 'tommcdo/vim-arsey'

filetype plugin on
syntax enable

" Run all config files
runtime! config/*.vim
