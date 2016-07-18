"====================GENERAL====================== 
"=================================================
set number
colo desert
set mouse=a
set nobackup                    "No backups!
set visualbell                  "No sounds!
set nohlsearch
set noswapfile                  "No swaps!
set wildmenu                    "Tab autocomplete commands
set guifont=Anonymous\ Pro\ Regular
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
filetype plugin indent on
syntax on

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

" Local Vimrc
if filereadable("./.lvimrc")
    execute "source ./.lvimrc"
endif

autocmd! bufwritepost .vimrc source %
