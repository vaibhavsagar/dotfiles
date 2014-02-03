set nocompatible
filetype off " For Vundle
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc("$HOME/vimfiles/bundle")

source $VIMRUNTIME/mswin.vim

" let Vundle manage Vundle
" required!
Bundle 'SirVer/ultisnips'
Bundle 'Yggdroot/indentLine'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
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
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

set encoding=utf-8
scriptencoding utf-8
set guifont=Consolas:h10
syntax enable
set background=light
colorscheme solarized
filetype plugin indent on

" General
set backspace=indent,eol,start whichwrap+=<,>,[,]
set hidden
set history=1000         " remember more commands and search history
set lazyredraw
set mouse=a
set nobackup
set noswapfile
set pastetoggle=<F2>
set ruler                " show the cursor position all the time
set showcmd              " display incomplete commands
set undolevels=1000      " use many muchos levels of undo

" Search options
set gdefault
set hlsearch
set incsearch            " do incremental searching
set smartcase

" Indenting options
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Formatting options
set colorcolumn=80
set linebreak
set list
set listchars=trail:.
set number
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
set splitbelow
set splitright

" Toggles
nnoremap <silent> <Leader>il :IndentLinesToggle<CR>
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>mt :MBEToggle<CR>
nnoremap <silent> <F5> :GundoToggle<CR>

" MBE mappings
nnoremap <silent> <Leader>mn :MBEbn<CR>
nnoremap <silent> <Leader>mp :MBEbp<CR>
nnoremap <silent> <Leader>mf :MBEbf<CR>
nnoremap <silent> <Leader>mb :MBEbb<CR>

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

" Gundo
let g:gundo_prefer_python3 = 1
let g:gundo_width = 30

" AutoCmds
autocmd BufWritePost _vimrc source $MYVIMRC
