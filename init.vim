
call plug#begin('~/.local/share/nvim/plugged')

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language pack
Plug 'sheerun/vim-polyglot'

" Linting etc
Plug 'w0rp/ale'

" Powerline
Plug 'itchyny/lightline.vim'

" Themes
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" Fzf search using ripgrep: hidden directories, case-insensitive unless
" capital letter in pattern, ignore .git (ripgrep respect .gitignore by
" default)
" export FZF_DEFAULT_COMMAND='rg --files --hidden --smartcase --glob "!.git/*"'


let mapleader = "\<Space>"

inoremap jj <esc>
nnoremap <c-p> :Files<cr>


set nocompatible
syntax on
colorscheme molokai
set guifont=DejaVu\ Sans\ Mono

set showmatch		" Show matching brackets
set ignorecase		" Case insensitive matching
set mouse=v		" Paste with mouse middle-click
set hlsearch		" Highlight search results
set tabstop=4		" Spaces per tab
set softtabstop=4
set expandtab		" Tabs are converted to spaces
set shiftwidth=4	" Autoindent size
set autoindent		" Automatically indent new lines
set number		" Line numbers

" Better search
 set hlsearch
 set incsearch
 set smartcase
