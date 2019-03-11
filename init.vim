
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

" Completions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'} " Run `go get -u github.com/stamblerre/gocode`

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

" Move through quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" FZF (https://github.com/junegunn/fzf.vim#commands)
" <c-t>/<c-x>/<c-v> - Open file in new tab/split/vertical
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
set relativenumber		" Line numbers
set cursorline      " Highlight current line
set title           " Let vim set the terminal title
set autowrite       " Save on :make like commands

" Better search
set hlsearch
set incsearch
set smartcase

" Helps with cursor disappear?
set nomousehide

" Automatically change working directory (root.vim)
let g:root#auto=1

" Use deoplete
let g:deoplete#enable_at_startup = 1

"" Go things
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" Faster update time for vim-go
let g:go_updatetime = 100

" Automatically import things
let g:go_fmt_command = "goimports"

" File type in airline
let g:go_auto_type_info = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
