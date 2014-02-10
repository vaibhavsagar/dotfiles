set nocompatible
filetype off " For Vundle
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc("$HOME/vimfiles/bundle")

source $VIMRUNTIME/mswin.vim

Bundle 'SirVer/ultisnips'
Bundle 'Yggdroot/indentLine'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'mhinz/vim-startify'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tomtom/shymenu_vim'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/pdc.vim'

" Display
colorscheme solarized
filetype plugin indent on
set background=light
set guifont=Consolas:h10
set lazyredraw
set number
set ruler                " show the cursor position all the time
set showcmd              " display incomplete commands
syntax enable

" General
set backspace=indent,eol,start whichwrap+=<,>,[,]
set completeopt=menuone,longest,preview
set encoding=utf-8
set hidden
set history=1000         " remember more commands and search history
set mouse=a
set nobackup
set noswapfile
set undolevels=1000      " use many muchos levels of undo

" Search
set gdefault
set hlsearch
set incsearch            " do incremental searching
set smartcase

" Indenting
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Formatting
set colorcolumn=80
set linebreak
set textwidth=0
set wrap
set wrapmargin=0

" Other
set autochdir
set foldlevel=99
set foldmethod=indent
set go-=T
set go-=m
set laststatus=2

" Toggles
nnoremap <silent> <F3> :MBEToggle<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :GundoToggle<CR>
nnoremap <silent> <F6> :IndentLinesToggle<CR>

" Tabularize mappings
nnoremap <Leader>t :Tab<Space>/
vnoremap <Leader>t :Tab<Space>/

" Other mappings
nnoremap <Leader>no :nohl<CR>
nnoremap <Leader>c  :close<CR>

" I don't like beeping
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=62 columns=90
    winpos 0 0
else
    set t_ut=
endif

" indentLine
let g:indentLine_char = '⁞'

" Airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Gundo
let g:gundo_prefer_python3 = 1
let g:gundo_width = 30

" Jedi
let g:jedi#force_py_version = 3
let g:jedi#auto_vim_configuration = 0

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1 " Put errors on left side
let g:syntastic_auto_loc_list = 2 " Only show errors when I ask
let g:syntastic_python_checkers=['flake8']

" Ultisnips
let g:UltiSnipsSnippetDirectories = ["snippets"]
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" AutoCmds
autocmd BufWritePost $MYVIMRC source $MYVIMRC
