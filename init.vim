
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

" NerdTree
Plug 'scrooloose/nerdtree'

" Change working directory to folder with .git
Plug 'dylanaraps/root.vim'

" Themes
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" Fzf search using ripgrep: hidden directories, case-insensitive unless
" capital letter in pattern, ignore .git (ripgrep respect .gitignore by
" default)
" export FZF_DEFAULT_COMMAND='rg --files --hidden --smartcase --glob "!.git/*"'


let mapleader = "\<Space>"

inoremap jj <esc>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
map <C-n> :NERDTreeToggle<CR>

" FZF (https://github.com/junegunn/fzf.vim#commands)
nnoremap <c-p> :Files<cr>
nnoremap <leader>fg :GFiles?<cr>
nnoremap <leader>ff :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fc :Maps<cr>

set nocompatible
syntax on
colorscheme molokai
set guifont=DejaVu\ Sans\ Mono

set showmatch		" Show matching brackets
set ignorecase		" Case insensitive matching
set mouse=a     	" Paste with mouse middle-click
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

" Helps with cursor disappear?
set nomousehide

" Automatically change working directory (root.vim)
let g:root#auto=1
