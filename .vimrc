"====================GENERAL====================== 
"=================================================
set encoding=utf-8              "UTF8
set t_Co=256                    "Colors
colo desert                     "Colorscheme
set ruler                       "Show the line and column in bottom right
set number                      "Show line numbers
set ls=2                        "Show status line
set expandtab                   "Spaces, no tabs
set backspace=2                 "Make backspacing work in insert
set tabstop=4                   "4 spaces per tab
set shiftwidth=4                "4 spaces for autoindent
set autoindent                  "Set new line to previous line indent
set autoread                    "Update files on change
set smartindent                 "Automatically indent
set nobackup                    "No backups!
set visualbell                  "No sounds!
set noswapfile                  "No swaps!
set wildmenu                    "Tab autocomplete commands

:let mapleader = ","            "Leader is comma
" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
"=================================================
set wildignore+=*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git
set wildignore+=.venv
"=================================================
nnoremap gj :m .+1<CR>
nnoremap gk :m .-2<CR>
"Easy save
nnoremap <leader>w :w!<CR>
" Easy escape
imap <C-c> <ESC>
" Easy window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Easy tab navigation
nnoremap H gT
nnoremap L gt
"Local Vimrc
if filereadable("./.lvimrc")
    execute "source ./.lvimrc"
endif
"Autoreload vimrc
autocmd! bufwritepost .vimrc source %
