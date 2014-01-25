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

Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/gundo.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-repeat'
Bundle 'mhinz/vim-startify'
Bundle 'tpope/vim-surround'
Bundle 'fholgado/minibufexpl.vim'

set encoding=utf-8
scriptencoding utf-8
set guifont=Consolas:h10
syntax enable
set background=light
colorscheme solarized
filetype plugin indent on

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set lazyredraw

set gdefault
set smartcase

set nobackup
set noswapfile
set pastetoggle=<F2>

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent

set number
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set colorcolumn=80

set list
set listchars=trail:.

set autochdir
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set go-=T
set laststatus=2

let g:indentLine_char = '⁞'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

nmap <silent> <Leader>il :IndentLinesToggle<CR>
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>


nmap <silent> <Leader>mt :MBEToggle<CR>
nmap <silent> <Leader>mn :MBEbn<CR>
nmap <silent> <Leader>mp :MBEbp<CR>
nmap <silent> <Leader>mf :MBEbf<CR>
nmap <silent> <Leader>mb :MBEbb<CR>

nmap <Leader>t :Tab<Space>/
vmap <Leader>t :Tab<Space>/

let g:UltiSnipsSnippetDirectories = ["snippets"]
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:gundo_prefer_python3 = 1

set noeb vb t_vb=
au GUIEnter * set vb t_vb=

if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=60 columns=90
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
