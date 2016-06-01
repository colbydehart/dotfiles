"====================GENERAL====================== 
"=================================================
set number
set mouse=a
set nobackup                    "No backups!
set visualbell                  "No sounds!
set nohlsearch
set noswapfile                  "No swaps!
set wildmenu                    "Tab autocomplete commands
set guifont=Inconsolata\ For\ Powerline
:let mapleader = " "            "Leader is space

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
"=================================================
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv

"==================================
" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'Shougo/vimproc.vim', { 'do': 'make' } 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
" PHP
Plug 'mkusher/padawan.php'
call plug#end()

filetype plugin indent on
syntax on
colo base

"=================================================
" Keybindings
nn <leader>; :NERDTreeToggle<CR>
nn <leader>f :CtrlP<CR>
nn <leader>k ZZ
nn <leader>n :tabe<CR>
nn <leader>t :sp term://bash<CR>
nn <leader>v :e ~/.vimrc<CR>
nn <leader>w :w!<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nn H gT
nn L gt

tnoremap <Esc> <C-\><C-n>

" Local Vimrc
if filereadable("./.lvimrc")
    execute "source ./.lvimrc"
endif

autocmd! bufwritepost .vimrc source %
