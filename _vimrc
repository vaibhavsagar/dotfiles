set nocompatible
filetype off " For Vundle
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc("$HOME/vimfiles/bundle")

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

Bundle 'SirVer/ultisnips'
Bundle 'Yggdroot/indentLine'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
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
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set nobackup
set noswapfile
set pastetoggle=<F2>
set lazyredraw

" Search options
set gdefault
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
set nolist
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
nmap <silent> <Leader>il :IndentLinesToggle<CR>
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" MBE mappings
nmap <silent> <Leader>mt :MBEToggle<CR>
nmap <silent> <Leader>mn :MBEbn<CR>
nmap <silent> <Leader>mp :MBEbp<CR>
nmap <silent> <Leader>mf :MBEbf<CR>
nmap <silent> <Leader>mb :MBEbb<CR>

" Tabularize mappings
nmap <Leader>t :Tab<Space>/
vmap <Leader>t :Tab<Space>/

" Clear highlighting
nmap <Leader>no :nohl<CR>

" I don't like beeping
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=62 columns=85
    winpos 0 0
else
    " This is console Vim.
    if exists("+lines")
        set lines=50
    endif
    if exists("+columns")
        set columns=85
    endif
endif

" Best character I've found so far
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

set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
