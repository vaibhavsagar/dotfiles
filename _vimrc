set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

execute pathogen#infect()
execute pathogen#helptags()
set gfn=Consolas:h10:cANSI
syntax enable
set background=light
colorscheme solarized

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set nobackup
set noswapfile
set pastetoggle=<F2>
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set number
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set colorcolumn=80
set autoindent
set autochdir
set foldmethod=indent
set foldlevel=99
set go-=T

set noeb vb t_vb=
au GUIEnter * set vb t_vb=

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=100
  winpos 0 0
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
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

