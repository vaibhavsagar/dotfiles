" vim:fdm=marker:fdl=0:fmr=-^-,-v-:

" Prologue -^-
set nocompatible
" -v-

" Vim-plug -^-
call plug#begin("$HOME/.vim/bundle")
" Plugins -^-
Plug 'tpope/vim-sensible'               " Sensible defaults.

Plug 'LnL7/vim-nix'
Plug 'Raimondi/delimitMate'             " Auto close brackets and quotes.
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Yggdroot/hiPairs'                 " Visually highlight surrounding pair.
Plug 'Yggdroot/indentLine'              " Visually highlight indents.
Plug 'airblade/vim-gitgutter'           " Show git diff in signs column.
Plug 'airblade/vim-rooter'              " Change directory to project root.
Plug 'altercation/vim-colors-solarized' " Solarized colour scheme.
Plug 'mkasa/lushtags', {'do': 'stack install'}
Plug 'bling/vim-bufferline'             " Space efficient buffer display.
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy searching.
" Plug 'eagletmt/ghcmod-vim'              " GHC-Mod support in Vim.
Plug 'ervandew/supertab'                " Tab completion.
Plug 'godlygeek/tabular'                " Align text as desired.
Plug 'idris-hackers/idris-vim'          " Idris mode for Vim.
Plug 'jszakmeister/vim-togglecursor'    " Toggle cursor in terminal.
Plug 'junegunn/goyo.vim'                " Distraction-free mode.
Plug 'junegunn/vim-peekaboo'            " View register contents.
Plug 'justinmk/vim-gtfo'                " Open terminal or file manager.
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent'
Plug 'machakann/vim-highlightedyank'    " Higlight yanked region.
Plug 'mbbill/undotree'                  " Visually navigate undo history.
Plug 'mhinz/vim-startify'               " Vim splash/start page.
Plug 'neomake/neomake'                  " Asynchronous linting and make.
Plug 'neovimhaskell/haskell-vim'        " Better Haskell syntax highlighting.
Plug 'ntpeters/vim-better-whitespace'   " Highlight trailing whitespace.
Plug 'raichoo/purescript-vim'           " PureScript syntax highlighting
Plug 'tmhedberg/SimpylFold'             " Intelligent Python code folding.
Plug 'tomtom/shymenu_vim'               " Hide Vim menu.
Plug 'tpope/vim-commentary'             " Operators for commenting.
Plug 'tpope/vim-dispatch'               " Asynchronous program launching.
Plug 'tpope/vim-eunuch'                 " Helpers for UNIX
Plug 'tpope/vim-fugitive'               " Git interface for Vim.
Plug 'tpope/vim-git'                    " Git runtime files.
Plug 'tpope/vim-markdown'               " Improved Markdown highlighting.
Plug 'tpope/vim-repeat'                 " Repeat plugin changes.
Plug 'tpope/vim-sleuth'                 " Smart indentation settings.
Plug 'tpope/vim-surround'               " Text objects for surroundings.
Plug 'tpope/vim-unimpaired'             " Useful pairs of mappings.
Plug 'tpope/vim-vinegar'                " Netrw wrapper.
Plug 'vim-airline/vim-airline'          " Full featured status bar.
Plug 'vim-airline/vim-airline-themes'   " Full featured status bar themes.
Plug 'vim-pandoc/vim-pandoc-syntax'     " Pandoc syntax highlighting.
Plug 'wting/rust.vim'                   " Rust syntax highlighting.
if executable("ctags")
  Plug 'majutsushi/tagbar'              " Easily browse current file tags.
  Plug 'xolox/vim-misc' | Plug 'xolox/vim-shell' | Plug 'xolox/vim-easytags'
endif
" Prefer Python 3 to Python 2.
if has("python3") || has("python")
  Plug 'davidhalter/jedi-vim'           " Python code completion.
  Plug 'vim-pandoc/vim-pandoc'          " Pandoc integration for Vim.
endif
" -v-
call plug#end()
" -v-

" AutoCmds -^-
augroup vimrc
  autocmd!
augroup end

" Remove bells.
autocmd vimrc VimEnter,GUIEnter * set vb t_vb=
" Source .vimrc on change.
autocmd vimrc BufWritePost $MYVIMRC source $MYVIMRC
" Display JSON files as JavaScript.
autocmd vimrc BufNewFile,BufRead *.json setlocal ft=javascript
" Ensure that SimpylFold works properly.
autocmd vimrc BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum)
                                      \ foldmethod=expr
autocmd vimrc BufWinLeave *.py setlocal foldexpr< foldmethod<

autocmd vimrc BufWrite * Neomake
" -v-

" Display -^-
if has("gui_running")
  " You can pry my Windows mappings from my cold, dead fingers.
  source $VIMRUNTIME/mswin.vim
  colorscheme solarized
  set background=light
  " Font settings.
  if has("win32") || has("win64")
    set guifont=Consolas:h10
  elseif has("mac")
    set guifont=Menlo:h12
  else
    set guifont=Ubuntu\ Mono\ 11
  endif
  set guioptions=cegrL
  set lines=67
  set columns=100
  winpos 0 0
elseif has("mac") || has("unix")
  colorscheme solarized
  set t_ut=
  let g:solarized_termcolors=256
endif
if exists("&colorcolumn")
  set colorcolumn=80
endif
set cursorline
set lazyredraw
set linespace=0
set noshowmode
set number
set numberwidth=1
set showcmd
set synmaxcol=240
" -v-

" Folding -^-
set foldlevel=99
set foldmarker=-^-,-v-
set foldmethod=marker
" -v-

" Formatting -^-
" Indentation specific settings are handled by vim-sleuth.
if exists("&breakindent")
  set breakindent
endif
set linebreak
set shiftround
set textwidth=0
set wrap
set wrapmargin=0
" -v-

" General -^-
" Try to use Python 3 as much as possible.
let s:python_version=has("python3") ? 3 : 2
set completeopt=menuone,longest,preview
set encoding=utf-8
set fileencoding=utf-8
set hidden
set mouse=a
" I don't need .swp files or backups cluttering up my workspace.
set nobackup
set noswapfile
set whichwrap+=<,>,[,]
" Going wild.
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.o,*.hi,*.class,*.pyc
if exists("&wildignorecase")
  set wildignorecase
endif
set wildmode=list:longest,full
function! PointFree() range
  let line_no = a:firstline
  let definition =join(getline(a:firstline, a:lastline), "\n")
  echom definition
  let output = systemlist('pointfree "'.definition.'"')[0]
  normal! gvc
  call setline(line_no, output)
endfunction
" -v-

" Search -^-
set gdefault
set hlsearch
set ignorecase
set smartcase
set wrapscan
" -v-

" Remappings -^-
let g:mapleader="\<Space>"
" Navigate wrapped lines as expected.
nnoremap <silent> gj j
nnoremap <silent> gk k
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
" Retain selection after changing indent.
xnoremap <silent> < <gv
xnoremap <silent> > >gv
" -v-

" Leader -^-
" Missing a good 'a' mapping :).
nnoremap <silent> <Leader>b :ls<CR>:b
nnoremap <silent> <Leader>c :close<CR>
nnoremap <silent> <Leader>d :bd<CR>
nnoremap <silent> <Leader>e :e $MYVIMRC<CR>
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
let g:ctrlp_cache_dir=$HOME . '/.vim/.cache/ctrlp'
" -v-

" DelimitMate -^-
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_nesting_quotes=['"', '''', '`']
" -v-

" Easytags -^-
let g:easytags_async=1
" -v-

" Fugitive -^-
nnoremap <Leader>g<Space>    :Git<Space>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gvdiff<CR>
nnoremap <silent> <Leader>gf :Gfetch<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
" -v-

" Gitgutter -^-
let g:gitgutter_map_keys=0
" -v-

" Gtfo -^-
let g:gtfo#terminals={'mac': 'iterm', 'win': 'cmd'}
" -v-

" HighlightedYank -^-
map y <Plug>(highlightedyank)
" -v-

" Haskell-vim -^-
let g:haskell_indent_disable = 1
" -v-

" IndentLine -^-
let g:indentLine_char='│'
let g:indentLine_fileTypeExclude=['text', 'markdown', 'pandoc']
nnoremap <silent> <F4> :IndentLinesToggle<CR>
" -v-

" Jedi -^-
let g:jedi#force_py_version=s:python_version
let g:jedi#auto_vim_configuration=0
let g:jedi#popup_on_dot=0
" -v-

" Neomake -^-
let g:neomake_haskell_enabled_makers = ['hdevtools', 'hlint']
" -v-

"Pandoc -^-
" Only syntax highlight pandoc files.
let g:pandoc#filetypes#pandoc_markdown=0
"-v-

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
let g:syntastic_enable_signs=1 " Put errors on left side.
let g:syntastic_auto_loc_list=2 " Only show errors when I ask.
let g:syntastic_python_checkers=['flake8']
" -v-

" Tabularize -^-
nnoremap <Leader>t :Tab<Space>/
vnoremap <Leader>t :Tab<Space>/
" -v-

" Undotree -^-
let g:undotree_SetFocusWhenToggle=1
nnoremap <silent> <F5> :UndotreeToggle<CR>
" -v-
" -v-
