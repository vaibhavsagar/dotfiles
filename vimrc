" vim:fdm=marker:foldlevel=0:foldmarker=-^-,-v-:

" Prologue -^-
set nocompatible
" -v-

" Vim-plug -^-
source ~/.vim/bundle/vim-plug/plug.vim
call plug#begin("$HOME/.vim/bundle")
" Plugins -^-
Plug 'Raimondi/delimitMate'             " Auto close brackets and quotes
Plug 'Yggdroot/indentLine'              " Visually highlight indents
Plug 'altercation/vim-colors-solarized' " Solarized colour scheme
Plug 'bling/vim-airline'                " Full featured status bar
Plug 'bling/vim-bufferline'             " Space efficient buffer display
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy searching
Plug 'ervandew/supertab'                " Tab completion
Plug 'godlygeek/tabular'                " Align text as desired
Plug 'honza/vim-snippets'               " Snippets for Ultisnips
Plug 'junegunn/goyo.vim'                " Distraction-free mode
Plug 'junegunn/vim-plug'                " Vim plugin manager
Plug 'justinmk/vim-gtfo'                " Open terminal or file manager
Plug 'kana/vim-textobj-indent'          " Indent text object
Plug 'kana/vim-textobj-user'            " Needed for indent text object
Plug 'mbbill/undotree'                  " Visually navigate undo history
Plug 'mhinz/vim-startify'               " Vim splash/start page
Plug 'ntpeters/vim-better-whitespace'   " Highlight trailing whitespace
Plug 'scrooloose/syntastic'             " General syntax checking
Plug 'tmhedberg/SimpylFold'             " Intelligent Python code folding
Plug 'tomtom/shymenu_vim'               " Hide Vim menu
Plug 'tpope/vim-dispatch'               " Asynchronous program launching
Plug 'tpope/vim-fugitive'               " Git interface for Vim
Plug 'tpope/vim-markdown'               " Improved Markdown highlighting
Plug 'tpope/vim-repeat'                 " Repeat plugin changes
Plug 'tpope/vim-surround'               " Text objects for surroundings
Plug 'tpope/vim-unimpaired'             " Useful pairs of mappings
Plug 'tpope/vim-vinegar'                " Netrw wrapper
Plug 'vim-pandoc/vim-pandoc-syntax'     " Pandoc syntax highlighting
Plug 'wting/rust.vim'                   " Rust syntax highlighting
if executable("ctags")
    Plug 'majutsushi/tagbar'            " Easily browse current file tags
    Plug 'xolox/vim-easytags'           " Automated tag generation
    Plug 'xolox/vim-misc'               " Helper functions for vim-easytags
    Plug 'xolox/vim-shell'              " Dependency for async vim-easytags
endif
if has("python3") || has("python")
    Plug 'SirVer/ultisnips'             " Snippet manager
    Plug 'davidhalter/jedi-vim'         " Python code completion
endif
" -v-
call plug#end()
" -v-

" AutoCmds -^-
" Remove bells
augroup removebells
    autocmd!
    autocmd VimEnter,GUIEnter * set vb t_vb=
augroup END
" Source .vimrc on change
augroup vimrcso
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" -v-

" Display -^-
if has("gui_running")
    " I like my Windows mappings
    source $VIMRUNTIME/mswin.vim
    colorscheme solarized
    if has("win32") || has("win64")
        set guifont=Consolas:h10
    elseif has("mac")
        set guifont=Menlo:h12
    else
        set guifont=Ubuntu\ Mono:h11
    endif
    set guioptions=cegrL
    set background=light
    set lines=67 columns=100
    winpos 0 0
else
    set t_ut=
    let g:solarized_termcolors=256
    if has("mac")
        colorscheme solarized
    endif
endif
"Windows specific text rendering
if exists("&renderoptions")
    set renderoptions=type:directx,
    \gamma:2.0,contrast:0.5,geom:1,
    \renmode:5,taamode:1,level:0.5
endif
set colorcolumn=80
set laststatus=2
set lazyredraw
set linespace=0
set noshowmode
set number
set numberwidth=1
set ruler
set scrolloff=5
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
if exists("&breakindent")
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
let s:python_version=has("python3") ? 3 : 2
runtime macros/matchit.vim
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
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.o,*.hi,*.class,*.pyc
if exists("&wildignorecase")
    set wildignorecase
endif
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
nnoremap <silent> <Leader>b :ls<CR>:b
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
let g:bufferline_show_bufnr=0
" -v-

" CtrlP -^-
let g:ctrlp_cmd='CtrlPBuffer'
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

" Easytags -^-
let g:easytags_async=1
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

" IndentLine -^-
let g:indentLine_char='│'
let g:indentLine_fileTypeExclude=['text', 'markdown', 'pandoc']
nnoremap <silent> <F4> :IndentLinesToggle<CR>
" -v-

" Jedi -^-
let g:jedi#force_py_version=s:python_version
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
let g:UltiSnipsUsePythonVersion=s:python_version
" -v-

" Undotree -^-
let g:undotree_SetFocusWhenToggle=1
nnoremap <silent> <F5> :UndotreeToggle<CR>
" -v-

" Vim-plug -^-
let g:plug_threads=(!has('ruby') || has('win32') || has('win64')) ? 1 : 16
" -v-
" -v-
