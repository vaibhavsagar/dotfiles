" vim:fdm=marker:foldlevel=0:

" Prologue {{{
set nocompatible
filetype off " For Vundle
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc("$HOME/vimfiles/bundle")
source $VIMRUNTIME/mswin.vim
" }}}

" Plugins {{{
Plugin 'SirVer/ultisnips'
Plugin 'Yggdroot/indentLine'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'justinmk/vim-gtfo'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-startify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tomtom/shymenu_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" }}}

" AutoCmds {{{
augroup vimrcso
    au!
    autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END
" }}}

" Display {{{
au GUIEnter * set vb t_vb=
filetype plugin indent on
if has("gui_running")
    colorscheme solarized
    set lines=67 columns=90
    winpos 0 0
else
    set t_ut=
endif
set background=light
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
syntax enable
" }}}

" Folding {{{
set foldlevel=99
set foldmethod=marker
" }}}

" Formatting {{{
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
" }}}

" General {{{
set autochdir
set autoread
set backspace=indent,eol,start whichwrap+=<,>,[,]
set completeopt=menuone,longest,preview
set encoding=utf-8
set fileencoding=utf-8
set hidden
set history=1000
set mouse=a
set nobackup
set noswapfile
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
" }}}

" Search {{{
set gdefault
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}

" Remappings {{{
let mapleader="\<Space>"
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
nnoremap <silent> j gj
nnoremap <silent> k gk
xnoremap <silent> < <gv
xnoremap <silent> > >gv
" }}}

" Toggles {{{
nnoremap <silent> <F4> :IndentLinesToggle<CR>
nnoremap <silent> <F5> :UndotreeToggle<CR>
" }}}

" Other {{{
nnoremap <Leader>c  :close<CR>
nnoremap <Leader>d  :bd<CR>
" }}}

" Configuration {{{
" Airline {{{
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
" }}}

" Bufferline {{{
let g:bufferline_echo=0
" }}}

" CtrlP {{{
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_custom_ignore={
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }
" }}}

" Fugitive {{{
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
" }}}

" IndentLine {{{
let g:indentLine_char='│'
" }}}

" Jedi {{{
let g:jedi#force_py_version=3
let g:jedi#auto_vim_configuration=0
" }}}

" Startify {{{
let g:startify_skiplist=[
    \ escape($VIMRUNTIME .'\doc', '\'),
    \ escape('AppData\Local\Temp', '\'),
    \ escape('bundle\.*\doc', '\')
    \ ]
" }}}

" Syntastic {{{
let g:syntastic_check_on_open=1
let g:syntastic_enable_balloons=1
let g:syntastic_enable_signs=1 " Put errors on left side
let g:syntastic_auto_loc_list=2 " Only show errors when I ask
let g:syntastic_python_checkers=['flake8']
" }}}

" Tabularize {{{
nnoremap <Leader>t :Tab<Space>/
vnoremap <Leader>t :Tab<Space>/
" }}}

" Ultisnips {{{
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsRemoveSelectModeMappings=0
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

" Undotree {{{
let g:undotree_SetFocusWhenToggle=1
" }}}

" Vinegar {{{
let g:netrw_liststyle=3
" }}}
" }}}
