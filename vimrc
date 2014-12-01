" vim:fdm=marker:foldlevel=0:foldmarker=-^-,-v-:

" Prologue -^-
set nocompatible
" -v-

" Vundle -^-
filetype off " For Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin("$HOME/.vim/bundle")
" Plugins -^-
if has("python3")
    Plugin 'SirVer/ultisnips'             " Snippet manager
endif
Plugin 'Raimondi/delimitMate'             " Auto close brackets and quotes
Plugin 'Yggdroot/indentLine'              " Visually highlight indents
Plugin 'altercation/vim-colors-solarized' " Solarized colour scheme
Plugin 'bling/vim-airline'                " Full featured status bar
Plugin 'bling/vim-bufferline'             " Space efficient buffer display
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy searching
Plugin 'davidhalter/jedi-vim'             " Python code completion
Plugin 'ervandew/supertab'                " Tab completion
Plugin 'gmarik/vundle'                    " Vim plugin manager
Plugin 'godlygeek/tabular'                " Align text as desired
Plugin 'honza/vim-snippets'               " Snippets for Ultisnips
Plugin 'junegunn/goyo.vim'                " Distraction-free mode
Plugin 'justinmk/vim-gtfo'                " Open terminal or file manager
Plugin 'kana/vim-textobj-indent'          " Indent text object
Plugin 'kana/vim-textobj-user'            " Needed for indent text object
Plugin 'mbbill/undotree'                  " Visually navigate undo history
Plugin 'mhinz/vim-startify'               " Vim splash/start page
Plugin 'ntpeters/vim-better-whitespace'   " Highlight trailing whitespace
Plugin 'scrooloose/syntastic'             " General syntax checking
Plugin 'tmhedberg/SimpylFold'             " Intelligent Python code folding
Plugin 'tomtom/shymenu_vim'               " Hide Vim menu
Plugin 'tpope/vim-dispatch'               " Asynchronous program launching
Plugin 'tpope/vim-fugitive'               " Git interface for Vim
Plugin 'tpope/vim-markdown'               " Improved Markdown highlighting
Plugin 'tpope/vim-repeat'                 " Repeat plugin changes
Plugin 'tpope/vim-surround'               " Text objects for surroundings
Plugin 'tpope/vim-unimpaired'             " Useful pairs of mappings
Plugin 'tpope/vim-vinegar'                " Netrw wrapper
Plugin 'vim-pandoc/vim-pandoc-syntax'     " Pandoc syntax highlighting
Plugin 'wting/rust.vim'                   " Rust syntax highlighting
" -v-
call vundle#end()
filetype plugin indent on
" -v-

" AutoCmds -^-
" Remove bells
au GUIEnter * set vb t_vb=
" Source .vimrc on change
augroup vimrcso
    au!
    autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END
" -v-

" Display -^-
if has("gui_running")
    " I like my Windows mappings
    source $VIMRUNTIME/mswin.vim
    colorscheme solarized
    set background=light
    set lines=67 columns=100
    winpos 0 0
else
    set t_ut=
endif
"Windows specific text rendering
if exists("&renderoptions")
    set renderoptions=type:directx,
    \gamma:2.0,contrast:0.5,geom:1,
    \renmode:5,taamode:1,level:0.5
endif
set colorcolumn=80
set guifont=Consolas:h10
set go=cegrL
set laststatus=2
set lazyredraw
set linespace=0
set noeb vb t_vb=
set noshowmode
set number
set numberwidth=1
set ruler
set showcmd
set synmaxcol=240
syntax enable
" -v-

" Folding -^-
set foldlevel=99
set foldmarker=-^-,-v-
set foldmethod=marker
" -v-

" Formatting -^-
if has("linebreak")
    set breakindent
endif
set autoindent
set expandtab
set linebreak
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=0
set wrap
set wrapmargin=0
" -v-

" General -^-
set autochdir
set autoread
set backspace=indent,eol,start
set completeopt=menuone,longest,preview
set encoding=utf-8
set fileencoding=utf-8
set hidden
set history=1000
set mouse=a
set nobackup
set noswapfile
set whichwrap+=<,>,[,]
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.o,*.hi,*.class
set wildignorecase
set wildmenu
set wildmode=list:longest,full
" -v-

" Search -^-
set gdefault
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan
" -v-

" Remappings -^-
let mapleader="\<Space>"
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
nnoremap <silent> gj j
nnoremap <silent> gk k
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk
xnoremap <silent> < <gv
xnoremap <silent> > >gv
" -v-

" Leader -^-
nnoremap <silent> <Leader>b :ls<CR>:b<Space>
nnoremap <silent> <Leader>c :close<CR>
nnoremap <silent> <Leader>d :bd<CR>
" -v-

" Configuration -^-
" Airline -^-
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
" -v-

" Bufferline -^-
let g:bufferline_echo=0
" -v-

" CtrlP -^-
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_custom_ignore={
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }
let g:ctrlp_cache_dir=escape($HOME . '\.vim\.cache\ctrlp', '\')
" -v-

" DelimitMate -^-
let delimitMate_expand_cr=1
let delimitMate_nesting_quotes=['"', '''']
" -v-

" Fugitive -^-
nnoremap <Leader>g<Space>    :Git<Space>
nnoremap <silent> <Leader>gb :Gbrowse<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
" -v-

" Gtfo -^-
let g:gtfo#terminals = {'win': 'cmd.exe'}
" -v-

" IndentLine -^-
let g:indentLine_char='│'
let g:indentLine_fileTypeExclude=['text', 'markdown', 'pandoc']
nnoremap <silent> <F4> :IndentLinesToggle<CR>
" -v-

" Jedi -^-
let g:jedi#force_py_version=3
let g:jedi#auto_vim_configuration=0
" -v-

" Startify -^-
let g:startify_skiplist=[
    \ escape($VIMRUNTIME .'\doc', '\'),
    \ escape('AppData\Local\Temp', '\'),
    \ escape('bundle\.*\doc', '\')
    \ ]
" -v-

" Syntastic -^-
let g:syntastic_check_on_open=1
let g:syntastic_enable_balloons=1
let g:syntastic_enable_signs=1 " Put errors on left side
let g:syntastic_auto_loc_list=2 " Only show errors when I ask
let g:syntastic_python_checkers=['flake8']
" -v-

" Tabularize -^-
nnoremap <Leader>t :Tab<Space>/
vnoremap <Leader>t :Tab<Space>/
" -v-

" Ultisnips -^-
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsRemoveSelectModeMappings=0
let g:UltiSnipsUsePythonVersion=3
" -v-

" Undotree -^-
let g:undotree_SetFocusWhenToggle=1
nnoremap <silent> <F5> :UndotreeToggle<CR>
" -v-
" -v-
