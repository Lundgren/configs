set nocompatible

" some colors
set t_Co=256
syntax on
set background=dark
colorscheme monokai

" display settings
set number			            " line numbers
set ruler			            " cursor position in status bar
set showmatch		            " highlight matching braces
set showmode		            " always display current mode
set wildmenu		            " <TAB> autocomplete commands
set wildmode=list:longest,full  " behaviour for autocomplete commands (probably worth experimenting with)
set wildignorecase              " case insensitive command autocomplete
set laststatus=2	            " always show statusbar
set scrolloff=3                 " make sure there are always 3 visible lines above or below the cursor

" edit settings
set backspace=indent,eol,start	" enable backspacing over everything
set backupdir=~/.vim/tmp        " temp files during development
set directory=~/.vim/tmp        " swap files during development

" search settings
set hlsearch		" highlight search results
set ignorecase		" case insensitive search
set smartcase		" case sensitive search if input is capitalized
set incsearch		" incremental search

" escape input mode with jj or jk
inoremap jj <ESC>
inoremap jk <ESC>

" indention
set autoindent
set expandtab		" tabs to spaces
set tabstop=4		" tabs are 4 spaces wide
set softtabstop=4	" tabs are 4 spaces wide when editing
set shiftwidth=4

" gvim specifics
if has('gui_running')
	set guioptions-=T		" hide toolbar
	set cursorline			" highlight current line
endif

" use bash in vim as fish isn't supported
set shell=bash

" plugins trough Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" add plugins here and run :PluginInstall
Plugin 'kien/ctrlp.vim'						" fuzzy search to open files
Plugin 'bling/vim-airline'					" better statusbar
Plugin 'scrooloose/nerdtree'				" filesystem window
Plugin 'scrooloose/syntastic'				" syntax checking in a lot of languages
Plugin 'pangloss/vim-javascript'			" better javascript syntax
Plugin 'jelera/vim-javascript-syntax'		" even better javascript syntax
Plugin 'mxw/vim-jsx'						" jsx support (requires pangloss/vim-javascript)
Plugin 'elixir-lang/vim-elixir'				" elixir syntax support
Plugin 'Valloric/YouCompleteMe'             " autocomplete code
Plugin 'marijnh/tern_for_vim'               " additional autocomplete for javascript
Plugin 'dag/vim-fish'                       " syntax for fish files

call vundle#end()
filetype plugin indent on

" plugin settings
" ctrlp - open files through fuzzy search
let g:ctrlp_map='<c-p>'						" open with <CTRL>+p
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': 'node_modules\|.git',
	\ 'file': '\.zip$|\.pyc$' 
	\ }

" syntastic
"	require install of:
"		npm install -g eslint
"		npm install -g jsonlint
"		pip install bashate
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1          " add errors to location-list
let g:syntastic_auto_loc_list=1                     " open the location-list when errors are found
let g:syntastic_check_on_open=1                     " check file on open
let g:syntastic_check_on_wq=0                       " don't check on save & close
let g:syntastic_javascript_checkers=['eslint']		" eslint required for jsx
let g:syntastic_enable_elixir_checker=1				" check elixir code

" vim-jsx
let g:jsx_ext_requires=0							" jsx highlight in .js files

" activate syntax for fish files
autocmd FileType fish compiler fish

