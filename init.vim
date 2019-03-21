call plug#begin('~/.local/share/nvim/plugged')

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Linting etc
Plug 'w0rp/ale'

" Powerline
Plug 'vim-airline/vim-airline'

" NerdTree
Plug 'scrooloose/nerdtree'

" Change working directory to folder with .git
Plug 'dylanaraps/root.vim'

" Workspace plugin
Plug 'thaerkh/vim-workspace'

" Extra mappings with [ & ]
Plug 'tpope/vim-unimpaired'

" Git plugins
Plug 'tpope/vim-fugitive'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Tmux/split navigation with <c-[hjkl]>
" Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'morhetz/gruvbox'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Auto pair brackets and similar
Plug 'jiangmiao/auto-pairs'
" Plug 'Raimondi/delimitMate'

" Completions
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'} " Run `go get -u github.com/stamblerre/gocode`
" Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-ultisnips'
" Plug 'ncm2/float-preview.nvim'
Plug 'ncm2/ncm2-markdown-subscope'

" Golang
Plug 'fatih/vim-go'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Language pack
Plug 'sheerun/vim-polyglot'

call plug#end()

let mapleader = "\<Space>"

inoremap jj <esc>
inoremap <C-l> <Right>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>vr :source $MYVIMRC<CR>
map <C-n> :NERDTreeToggle<CR>

" Move through quickfix
" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>

" FZF (https://github.com/junegunn/fzf.vim#commands)
" <c-t>/<c-x>/<c-v> - Open file in new tab/split/vertical
nnoremap <c-p> :Files<cr>
nnoremap <leader>fg :GFiles?<cr>
nnoremap <leader>ff :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fc :Maps<cr>

" Move between windows with <c-hjkl>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set nocompatible
syntax on
set termguicolors
" colorscheme molokai
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme='gruvbox'

set guifont=DejaVu\ Sans\ Mono

set showmatch		" Show matching brackets
set ignorecase		" Case insensitive matching
set mouse=a     	" Paste with mouse middle-click
set hlsearch		" Highlight search results
set tabstop=4		" Spaces per tab
set softtabstop=4
set expandtab		" Tabs are converted to spaces
set shiftwidth=4	" Auto indent size
set autoindent		" Automatically indent new lines
set number relativenumber		" Line numbers
set cursorline      " Highlight current line
set title           " Let vim set the terminal title
set autowrite       " Save on :make like commands
set clipboard+=unnamedplus  " System clipboard
set spelllang=en    " Enable spelling z= for suggestions
set spell
set splitbelow      " Better split
set splitright
set scrolloff=5     " Always leave empty lines above/below cursor when scrolling

" Better search
set hlsearch
set incsearch
set smartcase

" Helps with cursor disappear?
set nomousehide

" Move undo dirs away from the project
set undodir=~/.local/share/nvim/undo/

" Automatically change working directory (root.vim)
let g:root#auto=1

" Use deoplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Control with c-j, c-k & c-l
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<Right>"
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


""" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'


""" Ale 
let g:ale_sign_column_always = 1 " Make sure the sign column always have room for error signs
let g:airline#extensions#ale#enabled = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1


""" Workspace
let g:workspace_session_directory = $HOME . '/.local/share/nvim/sessions/' " Keep sessions outside of the project path
let g:workspace_autosave = 0 " Don't auto save


""" Auto-pair
let g:AutoPairsMapCR = 0 " Doesn't work with ncm2 (github.com/ncm2/ncm2/issues/129)
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>\<C-R>=AutoPairsReturn()<CR>", 'n')

""" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


""" Vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 0
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0
let g:go_auto_sameids = 1

" Faster update time for vim-go
let g:go_updatetime = 100

" Automatically import things
let g:go_fmt_command = "goimports"

" camelCase for annotations
let g:go_addtags_transform = "camelcase"

" File type in airline
" let g:go_auto_type_info = 1


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>gf <Plug>(go-test-func)
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
autocmd Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
autocmd Filetype go nmap <leader>gah <Plug>(go-alternate-split)
autocmd Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
autocmd FileType go nmap <leader>gt :GoDeclsDir<cr>
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>gd <Plug>(go-def)
autocmd FileType go nmap <leader>gdv <Plug>(go-def-vertical)
autocmd FileType go nmap <leader>gdh <Plug>(go-def-split))


" Markdown
let g:vim_markdown_folding_disabled = 1 " Disable folding
